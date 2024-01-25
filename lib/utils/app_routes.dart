import 'package:flutter/material.dart';
import '../modules/repo_list/model/repo_list_response.dart';
import '/modules/repo_details/views/repo_details_screen.dart';
import '/modules/repo_list/view/repo_list_screen.dart';

enum AppRoutes {
  repoList,
  repoDetails,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.repoList:
        return const RepoListScreen();
      case AppRoutes.repoDetails:
        return RepoDetailsScreen(
          repositoryItem: arguments as RepositoryItem,
        );
    }
  }
}
