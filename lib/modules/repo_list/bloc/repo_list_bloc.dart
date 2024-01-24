import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/modules/repo_list/bloc/repo_list_state.dart';

import 'repo_list_event.dart';

class RepoListBloc extends Bloc<RepoListEvent, RepoListState> {
  RepoListBloc() : super(const RepoListState()) {}
}
