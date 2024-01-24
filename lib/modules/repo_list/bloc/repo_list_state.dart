import 'package:flutter/material.dart';

import '../../../utils/enum.dart';
import '../model/repo_list_response.dart';

@immutable
class RepoListState {
  final AppStatus fetchRepoStatus;
  final List<RepositoryItem>? repoListItem;

  const RepoListState({
    this.fetchRepoStatus = AppStatus.loading,
    this.repoListItem,
  });

  RepoListState copyWith({
    AppStatus? fetchRepoStatus,
    List<RepositoryItem>? repoListItem,
  }) {
    return RepoListState(
      fetchRepoStatus: fetchRepoStatus ?? this.fetchRepoStatus,
      repoListItem: repoListItem ?? this.repoListItem,
    );
  }
}
