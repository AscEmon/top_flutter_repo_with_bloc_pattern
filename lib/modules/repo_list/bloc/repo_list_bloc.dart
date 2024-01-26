import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/utils/network_connection.dart';

import '../../../utils/enum.dart';
import '../model/repo_list_response.dart';
import '../repository/repo_list_interface.dart';
import '../repository/repo_list_repository.dart';
import '/modules/repo_list/bloc/repo_list_state.dart';
import 'repo_list_event.dart';

class RepoListBloc extends Bloc<RepoListEvent, RepoListState> {
  int paginatedPageNo = 1;
  List<RepositoryItem> tempListItem = [];
  late Timer _apiCallTimer;
  bool isAlreadyRefreshCall = false;
  final IRepoListRepository _iRepoListRepository = RepoListRepository();
  RepoListBloc()
      : super(
          RepoListState(
            scrollController: ScrollController(),
          ),
        ) {
    on<LoadRepoListEvent>(_fetchRepos);
    on<RefreshRepoListEvent>(_refreshRepoList);
    on<SortRepoListEvent>(_sortRepolist);
    state.scrollController?.addListener(() {
      add(PaginationListEvent());
    });
    on<PaginationListEvent>(_scrollListener);
  }
  void _fetchRepos(LoadRepoListEvent event, Emitter<RepoListState> emit) async {
    try {
      List<RepositoryItem> result =
          await _iRepoListRepository.fetchRepoList(_setParams());
      tempListItem.addAll(result);
      emit(
        state.copyWith(
          fetchRepoStatus: AppStatus.success,
          repoListItem: tempListItem,
        ),
      );
    } catch (error) {
      emit(state.copyWith(fetchRepoStatus: AppStatus.error));
    }
  }

  Map<String, dynamic> _setParams({int page = 1}) {
    final map = <String, dynamic>{};
    map["q"] = "Flutter";
    map["per_page"] = 10;
    map["page"] = page;
    return map;
  }

  void _refreshRepoList(event, emit) {
    if (!isAlreadyRefreshCall) {
      if (!NetworkConnection.instance.isInternet) {}
      state.repoListItem!.clear();
      paginatedPageNo = 1;
      tempListItem.clear();
      emit(state.copyWith(fetchRepoStatus: AppStatus.loading));
      add(LoadRepoListEvent());
      isAlreadyRefreshCall = true;
    }
    _apiCallTimer = Timer.periodic(
      const Duration(minutes: 30),
      (timer) {
        isAlreadyRefreshCall = false;
      },
    );
  }

  void _scrollListener(event, emit) async {
    if (state.scrollController?.position.pixels ==
        state.scrollController?.position.maxScrollExtent) {
      try {
        emit(state.copyWith(isMoreLoaded: true));
        paginatedPageNo++;
        final newRepoItem = await _iRepoListRepository.fetchRepoList(
          _setParams(page: paginatedPageNo),
        );

        if (!NetworkConnection.instance.isInternet &&
            isSameList(state.repoListItem!, newRepoItem)) {
          return;
        }

        emit(
          state.copyWith(
            fetchRepoStatus: AppStatus.success,
            repoListItem: [...state.repoListItem!, ...newRepoItem],
          ),
        );
      } catch (e) {
        emit(state.copyWith(isMoreLoaded: false));
      }
    } else {
      emit(state.copyWith(isMoreLoaded: false));
    }
  }

  bool isSameList(
      List<RepositoryItem> repoListItem, List<RepositoryItem> newRepoItem) {
    var condition1 =
        repoListItem.toSet().difference(newRepoItem.toSet()).isEmpty;
    var condition2 = repoListItem.length == newRepoItem.length;
    return condition1 && condition2;
  }

  void _sortRepolist(event, emit) async {
    final List<RepositoryItem> sortedList = List.from(state.repoListItem!);

    sortedList.sort(
      (a, b) => a.updatedAt!.compareTo(
        b.updatedAt ?? DateTime.now(),
      ),
    );

    emit(state.copyWith(repoListItem: sortedList));
  }

  @override
  Future<void> close() {
    _apiCallTimer.cancel();
    return super.close();
  }
}
