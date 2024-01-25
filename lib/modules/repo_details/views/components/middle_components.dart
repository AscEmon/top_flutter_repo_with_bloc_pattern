import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_flutter_repo/utils/extension.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../utils/styles/styles.dart';
import '../../../repo_list/model/repo_list_response.dart';

class MiddleComponents extends StatelessWidget {
  const MiddleComponents({super.key, required this.repositoryItem});
  final RepositoryItem repositoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: KColor.white.color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GlobalText(
              str: "Repository: ${repositoryItem.name}",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(
              height: 4.h,
            ),
            GlobalText(
              str: "Owner: ${repositoryItem.owner?.login}",
              fontSize: 14,
              color: KColor.grey.color,
            ),
            const GlobalText(
              str: "Description",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            SizedBox(
              height: 4.h,
            ),
            GlobalText(
              str: repositoryItem.description ?? "",
              fontSize: 14,
              color: KColor.grey.color,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                const GlobalText(
                  str: "Updated At: ",
                  fontWeight: FontWeight.bold,
                ),
                GlobalText(
                  str: repositoryItem.updatedAt!.formattedDateFromDate(),
                  color: KColor.grey.color,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.watch,
                  size: 20,
                ),
                SizedBox(
                  width: 4.w,
                ),
                GlobalText(
                  str: repositoryItem.watchers.toString(),
                  fontSize: 12,
                  color: KColor.grey.color,
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.sync_problem_outlined,
                  size: 20,
                ),
                SizedBox(
                  width: 4.w,
                ),
                GlobalText(
                  str: repositoryItem.openIssues.toString(),
                  fontSize: 12,
                  color: KColor.grey.color,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
