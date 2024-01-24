import 'package:flutter/material.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../utils/styles/styles.dart';
import '../../model/repo_list_response.dart';

class RepoListItem extends StatelessWidget {
  const RepoListItem({
    super.key,
    required this.repoItem,
  });

  final RepositoryItem repoItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: KColor.fill.color,
      title: GlobalText(
        str: repoItem.name ?? "",
      ),
      subtitle: GlobalText(
        str: repoItem.owner?.url ?? "",
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const GlobalText(str: "Created At"),
          GlobalText(
            str: repoItem.createdAt?.toIso8601String() ?? "",
          ),
        ],
      ),
    );
  }
}
