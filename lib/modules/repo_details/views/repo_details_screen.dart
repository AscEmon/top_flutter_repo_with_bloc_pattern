import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_flutter_repo/global/widget/global_image_loader.dart';
import 'package:top_flutter_repo/modules/repo_details/views/components/middle_components.dart';
import 'package:top_flutter_repo/utils/enum.dart';
import 'package:top_flutter_repo/utils/extension.dart';
import 'package:top_flutter_repo/utils/styles/k_colors.dart';
import '../../../global/widget/global_text.dart';
import '/global/widget/global_appbar.dart';

import '../../repo_list/model/repo_list_response.dart';

class RepoDetailsScreen extends StatelessWidget {
  const RepoDetailsScreen({super.key, required this.repositoryItem});
  final RepositoryItem repositoryItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Repository Details",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.h,
              width: context.width,
              child: GlobalImageLoader(
                imagePath: repositoryItem.owner?.avatarUrl ?? "",
                imageFor: ImageFor.network,
                fit: BoxFit.fitWidth,
              ),
            ),
            MiddleComponents(repositoryItem: repositoryItem),
            if (repositoryItem.topics!.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: const GlobalText(
                  str: "Topics",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 10,
                  children: List.generate(
                    repositoryItem.topics!.length,
                    (index) => Chip(
                      backgroundColor: KColor.black.color,
                      label: GlobalText(
                        str: repositoryItem.topics![index],
                        color: KColor.white.color,
                      ),
                    ),
                  ),
                ),
              )
            ],
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
