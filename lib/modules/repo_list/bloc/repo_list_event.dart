sealed class RepoListEvent {}

class LoadRepoListEvent implements RepoListEvent {}

class PaginationListEvent implements RepoListEvent {}

class RefreshRepoListEvent implements RepoListEvent {}

class SortRepoListEvent implements RepoListEvent {}
