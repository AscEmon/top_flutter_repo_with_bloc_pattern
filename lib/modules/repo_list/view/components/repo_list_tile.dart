import 'package:flutter/material.dart';
import 'package:top_flutter_repo/utils/app_routes.dart';
import 'package:top_flutter_repo/utils/extension.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/styles/styles.dart';
import '../../model/repo_list_response.dart';

class RepoListItem extends StatelessWidget {
  const RepoListItem({super.key, required this.repoItem});

  final RepositoryItem repoItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigation.push(
          context,
          appRoutes: AppRoutes.repoDetails,
          arguments: repoItem,
        );
      },
      tileColor: KColor.fill.color,
      title: GlobalText(
        str: repoItem.name ?? "",
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GlobalText(
                str: context.loc.url,
                fontWeight: FontWeight.bold,
              ),
              Flexible(
                child: GlobalText(
                  str: repoItem.owner?.url ?? "",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GlobalText(
                str: context.loc.updated_at,
                fontWeight: FontWeight.bold,
              ),
              GlobalText(
                str: repoItem.updatedAt?.formattedDateFromDate() ?? "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
