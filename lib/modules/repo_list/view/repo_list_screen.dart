import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_flutter_repo/global/widget/global_appbar.dart';
import 'package:top_flutter_repo/global/widget/global_text.dart';
import 'package:top_flutter_repo/modules/repo_list/bloc/repo_list_bloc.dart';
import 'package:top_flutter_repo/modules/repo_list/bloc/repo_list_event.dart';
import 'package:top_flutter_repo/modules/repo_list/view/components/repo_list_tile.dart';

import '../../../utils/enum.dart';
import '../../../utils/styles/styles.dart';
import '../bloc/repo_list_state.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: BlocBuilder<RepoListBloc, RepoListState>(
                builder: (context, state) {
                  if (state.fetchRepoStatus == AppStatus.success) {
                    if (state.repoListItem?.isNotEmpty == true) {
                      return ListView.separated(
                        controller: state.scrollController,
                        itemCount: state.repoListItem!.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10.h);
                        },
                        itemBuilder: (context, index) {
                          return RepoListItem(
                            repoItem: state.repoListItem![index],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: GlobalText(str: "No Data Found"),
                      );
                    }
                  } else if (state.fetchRepoStatus == AppStatus.error) {
                    return Center(
                      child: GlobalText(
                        str: "Error occured",
                        color: KColor.red.color,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
