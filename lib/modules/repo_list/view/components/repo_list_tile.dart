import 'package:flutter/material.dart';
import 'package:top_flutter_repo/constant/constant_key.dart';
import 'package:top_flutter_repo/utils/extension.dart';

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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const GlobalText(
                str: "URL: ",
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
              const GlobalText(
                str: "Updated At: ",
                fontWeight: FontWeight.bold,
              ),
              GlobalText(
                str: repoItem.updatedAt?.formattedDateFromDate(
                        AppConstant.MM_DD_YYYY_HM.key) ??
                    "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
