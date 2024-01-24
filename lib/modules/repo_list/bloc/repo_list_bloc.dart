import 'package:flutter_bloc/flutter_bloc.dart';
import '/modules/repo_list/bloc/repo_list_state.dart';

import '../../../utils/enum.dart';
import '../model/repo_list_response.dart';
import '../repository/repo_list_interface.dart';
import '../repository/repo_list_repository.dart';
import 'repo_list_event.dart';

class RepoListBloc extends Bloc<RepoListEvent, RepoListState> {
  final IRepoListRepository _iRepoListRepository = RepoListRepository();
  RepoListBloc() : super(const RepoListState()) {
    on<LoadRepoListEvent>(_fetchRepos);
  }
  void _fetchRepos(LoadRepoListEvent event, Emitter<RepoListState> emit) async {
    try {
      List<RepositoryItem> result =
          await _iRepoListRepository.fetchRepoList(_setParams());
      emit(
        state.copyWith(
          fetchRepoStatus: AppStatus.success,
          repoListItem: result,
        ),
      );
    } catch (error) {
      emit(state.copyWith(fetchRepoStatus: AppStatus.error));
    }
  }

  Map<String, dynamic> _setParams() {
    final map = <String, dynamic>{};
    map["q"] = "Flutter";
    map["per_page"] = 10;
    return map;
  }
}
