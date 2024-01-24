import 'package:flutter/material.dart';
import '../model/repo_list_response.dart';

@immutable
abstract class IRepoListRepository {
  Future<List<RepositoryItem>> fetchRepoList(Map<String, dynamic> params);
}
