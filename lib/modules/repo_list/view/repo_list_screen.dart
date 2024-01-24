import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/global/widget/global_appbar.dart';
import 'package:top_flutter_repo/global/widget/global_text.dart';
import 'package:top_flutter_repo/modules/repo_list/bloc/repo_list_bloc.dart';
import 'package:top_flutter_repo/modules/repo_list/bloc/repo_list_event.dart';

class RepoListScreen extends StatefulWidget {
  const RepoListScreen({super.key});

  @override
  State<RepoListScreen> createState() => _RepoListScreenState();
}

class _RepoListScreenState extends State<RepoListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RepoListBloc>().add(LoadRepoListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "Top Flutter Repository"),
      body: const GlobalText(str: "Project Setup"),
    );
  }
}
