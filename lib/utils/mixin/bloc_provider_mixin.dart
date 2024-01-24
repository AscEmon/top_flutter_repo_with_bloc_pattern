import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/modules/repo_list/bloc/repo_list_bloc.dart';

mixin BlocProviderMixin {
  blocProviders() {
    return [
      BlocProvider(create: (context) => RepoListBloc())
    ];
  }
}
