import 'package:flutter/material.dart';

import '../../../utils/enum.dart';
import '../model/repo_list_response.dart';

@immutable
class RepoListState {
  final AppStatus fetchRepoStatus;
  final List<RepositoryItem>? repoListItem;
  final bool isMoreLoaded;
  final ScrollController? scrollController;

  const RepoListState({
    this.fetchRepoStatus = AppStatus.loading,
    this.repoListItem,
    this.scrollController,
    this.isMoreLoaded = true,
  });

  RepoListState copyWith({
    AppStatus? fetchRepoStatus,
    List<RepositoryItem>? repoListItem,
    int? page,
    bool? isMoreLoaded,
  }) {
    return RepoListState(
      fetchRepoStatus: fetchRepoStatus ?? this.fetchRepoStatus,
      repoListItem: repoListItem ?? this.repoListItem,
      scrollController: scrollController,
      isMoreLoaded: isMoreLoaded ?? this.isMoreLoaded,
    );
  }
}
