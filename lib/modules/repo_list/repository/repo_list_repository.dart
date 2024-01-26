import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:top_flutter_repo/constant/constant_key.dart';
import 'package:top_flutter_repo/utils/extension.dart';
import 'package:top_flutter_repo/utils/network_connection.dart';

import '../../../constant/app_url.dart';
import '../../../utils/enum.dart';
import '../../../utils/network_request_builder.dart';
import '/modules/repo_list/model/repo_list_response.dart';
import 'repo_list_interface.dart';

class RepoListRepository implements IRepoListRepository {
  @override
  Future<List<RepositoryItem>> fetchRepoList(
      Map<String, dynamic> params) async {
    Completer<List<RepositoryItem>> completer =
        Completer<List<RepositoryItem>>();

    try {
      if (NetworkConnection.instance.isInternet == false) {
        List<RepositoryItem> cachedData = await _loadCachedData();
        if (cachedData.isNotEmpty) {
          completer.complete(cachedData);
        } else {
          completer.complete([]);
        }
      } else {
        _makeNetworkRequest(params, completer);
      }
      
    } catch (e) {
      "loading data from Hive: $e".log();
    }

    return completer.future;
  }

  Future<List<RepositoryItem>> _loadCachedData() async {
    var box = await Hive.openBox<RepositoryItem>(AppConstant.HIVE_REPOLIST.key);
    "box is :${box.values.length}".log();
    return box.values.toList();
  }

  void _makeNetworkRequest(
    Map<String, dynamic> params,
    Completer<List<RepositoryItem>> completer,
  ) {
    NetworkRequestBuilder()
        .setUrl(AppUrl.repoList.url)
        .setMethod(Method.GET)
        .setParams(params)
        .setOnSuccess((response) async {
      RepositoryListResponse res =
          RepositoryListResponse.fromJson(response.data);
      if (res.items != null && res.items?.isNotEmpty == true) {
        await _saveDataToHive(res.items ?? []);
        completer.complete(res.items);
      } else {
        completer.complete([]);
      }
    }).setOnFailed((errorMessage) {
      completer.completeError(errorMessage);
    }).executeNetworkRequest();
  }

  Future<void> _saveDataToHive(List<RepositoryItem> items) async {
    try {
      var box =
          await Hive.openBox<RepositoryItem>(AppConstant.HIVE_REPOLIST.key);

      await box.clear();
      await box.addAll(items);
    } catch (e) {
      "Hive: $e".log();
    }
  }
}
