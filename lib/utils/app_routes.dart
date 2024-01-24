import 'package:flutter/material.dart';
import 'package:top_flutter_repo/modules/repo_list/view/repo_list_screen.dart';

enum AppRoutes {
  repoList,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.repoList:
        return const RepoListScreen();
    }
  }
}
