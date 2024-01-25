import 'package:flutter/material.dart';

import '../../../utils/enum.dart';
import '../model/repo_list_response.dart';

@immutable
class RepoListState {
  final AppStatus fetchRepoStatus;
  final List<RepositoryItem>? repoListItem;

  final ScrollController? scrollController;

  const RepoListState({
    this.fetchRepoStatus = AppStatus.loading,
    this.repoListItem,
    this.scrollController,
  });

  RepoListState copyWith({
    AppStatus? fetchRepoStatus,
    List<RepositoryItem>? repoListItem,
    int? page,
  }) {
    return RepoListState(
      fetchRepoStatus: fetchRepoStatus ?? this.fetchRepoStatus,
      repoListItem: repoListItem ?? this.repoListItem,
      scrollController: scrollController,
    );
  }
}
