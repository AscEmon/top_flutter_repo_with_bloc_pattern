import 'dart:async';
import '/modules/repo_list/model/repo_list_response.dart';
import '../../../constant/app_url.dart';
import '../../../utils/enum.dart';
import '../../../utils/network_request_builder.dart';
import 'repo_list_interface.dart';

class RepoListRepository implements IRepoListRepository {
  @override
  Future<List<RepositoryItem>> fetchRepoList(
    Map<String, dynamic> params,
  ) async {
    Completer<List<RepositoryItem>> completer =
        Completer<List<RepositoryItem>>();
    NetworkRequestBuilder()
        .setUrl(AppUrl.repoList.url)
        .setMethod(Method.GET)
        .setShowLoader(true)
        .setParams(params)
        .setOnSuccess((response) {
      RepositoryListResponse res =
          RepositoryListResponse.fromJson(response.data);
      if (res.items != null && res.items?.isNotEmpty == true) {
        completer.complete(res.items);
      } else {
        completer.complete([]);
      }
    }).setOnFailed((errorMessage) {
      completer.completeError(errorMessage);
    }).executeNetworkRequest();

    return completer.future;
  }
}
