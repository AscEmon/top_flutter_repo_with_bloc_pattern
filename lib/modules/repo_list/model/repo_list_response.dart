import 'package:hive/hive.dart';

part 'repo_list_response.g.dart';

class RepositoryListResponse {
  int? totalCount;
  bool? incompleteResults;
  List<RepositoryItem>? items;

  RepositoryListResponse({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory RepositoryListResponse.fromJson(Map<String, dynamic> json) =>
      RepositoryListResponse(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: json["items"] == null
            ? []
            : List<RepositoryItem>.from(
                json["items"]!.map((x) => RepositoryItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

// class RepositoryItem {
//   int id;
//   String? nodeId;
//   String? name;
//   String? fullName;
//   bool? private;
//   Owner? owner;
//   String? description;
//   String? url;
//   String? pullsUrl;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? pushedAt;
//   String? gitUrl;
//   String? sshUrl;
//   String? cloneUrl;
//   String? svnUrl;
//   String? homepage;
//   List<String>? topics;
//   String? visibility;
//   int? forks;
//   int? openIssues;
//   int? watchers;
//   String? defaultBranch;
//   double? score;

//   RepositoryItem({
//     this.id = 0,
//     this.nodeId,
//     this.name,
//     this.fullName,
//     this.description,
//     this.private,
//     this.owner,
//     this.url,
//     this.pullsUrl,
//     this.createdAt,
//     this.updatedAt,
//     this.pushedAt,
//     this.gitUrl,
//     this.sshUrl,
//     this.cloneUrl,
//     this.svnUrl,
//     this.homepage,
//     this.topics,
//     this.visibility,
//     this.forks,
//     this.openIssues,
//     this.watchers,
//     this.defaultBranch,
//     this.score,
//   });

//   factory RepositoryItem.fromJson(Map<String, dynamic> json) => RepositoryItem(
//         id: json["id"],
//         nodeId: json["node_id"],
//         name: json["name"],
//         fullName: json["full_name"],
//         private: json["private"],
//         description: json["description"],
//         owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
//         url: json["url"],
//         pullsUrl: json["pulls_url"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         pushedAt: json["pushed_at"] == null
//             ? null
//             : DateTime.parse(json["pushed_at"]),
//         gitUrl: json["git_url"],
//         sshUrl: json["ssh_url"],
//         cloneUrl: json["clone_url"],
//         svnUrl: json["svn_url"],
//         homepage: json["homepage"],
//         topics: json["topics"] == null
//             ? []
//             : List<String>.from(json["topics"]!.map((x) => x)),
//         visibility: json["visibility"],
//         forks: json["forks"],
//         openIssues: json["open_issues"],
//         watchers: json["watchers"],
//         defaultBranch: json["default_branch"],
//         score: json["score"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "node_id": nodeId,
//         "name": name,
//         "full_name": fullName,
//         "description": description,
//         "private": private,
//         "owner": owner?.toJson(),
//         "url": url,
//         "pulls_url": pullsUrl,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "pushed_at": pushedAt?.toIso8601String(),
//         "git_url": gitUrl,
//         "ssh_url": sshUrl,
//         "clone_url": cloneUrl,
//         "svn_url": svnUrl,
//         "homepage": homepage,
//         "topics":
//             topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
//         "visibility": visibility,
//         "forks": forks,
//         "open_issues": openIssues,
//         "watchers": watchers,
//         "default_branch": defaultBranch,
//         "score": score,
//       };
// }

// class Owner {
//   String? login;
//   int? id;
//   String? nodeId;
//   String? avatarUrl;
//   String? gravatarId;
//   String? url;
//   String? htmlUrl;
//   String? followersUrl;
//   String? followingUrl;
//   String? gistsUrl;
//   String? starredUrl;
//   String? subscriptionsUrl;
//   String? organizationsUrl;
//   String? reposUrl;
//   String? eventsUrl;
//   String? receivedEventsUrl;
//   String? type;
//   bool? siteAdmin;

//   Owner({
//     this.login,
//     this.id,
//     this.nodeId,
//     this.avatarUrl,
//     this.gravatarId,
//     this.url,
//     this.htmlUrl,
//     this.followersUrl,
//     this.followingUrl,
//     this.gistsUrl,
//     this.starredUrl,
//     this.subscriptionsUrl,
//     this.organizationsUrl,
//     this.reposUrl,
//     this.eventsUrl,
//     this.receivedEventsUrl,
//     this.type,
//     this.siteAdmin,
//   });

//   factory Owner.fromJson(Map<String, dynamic> json) => Owner(
//         login: json["login"],
//         id: json["id"],
//         nodeId: json["node_id"],
//         avatarUrl: json["avatar_url"],
//         gravatarId: json["gravatar_id"],
//         url: json["url"],
//         htmlUrl: json["html_url"],
//         followersUrl: json["followers_url"],
//         followingUrl: json["following_url"],
//         gistsUrl: json["gists_url"],
//         starredUrl: json["starred_url"],
//         subscriptionsUrl: json["subscriptions_url"],
//         organizationsUrl: json["organizations_url"],
//         reposUrl: json["repos_url"],
//         eventsUrl: json["events_url"],
//         receivedEventsUrl: json["received_events_url"],
//         type: json["type"],
//         siteAdmin: json["site_admin"],
//       );

//   Map<String, dynamic> toJson() => {
//         "login": login,
//         "id": id,
//         "node_id": nodeId,
//         "avatar_url": avatarUrl,
//         "gravatar_id": gravatarId,
//         "url": url,
//         "html_url": htmlUrl,
//         "followers_url": followersUrl,
//         "following_url": followingUrl,
//         "gists_url": gistsUrl,
//         "starred_url": starredUrl,
//         "subscriptions_url": subscriptionsUrl,
//         "organizations_url": organizationsUrl,
//         "repos_url": reposUrl,
//         "events_url": eventsUrl,
//         "received_events_url": receivedEventsUrl,
//         "type": type,
//         "site_admin": siteAdmin,
//       };
// }

@HiveType(typeId: 0)
class RepositoryItem extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? nodeId;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? fullName;

  @HiveField(4)
  bool? private;

  @HiveField(5)
  Owner? owner;

  @HiveField(6)
  String? description;

  @HiveField(7)
  String? url;

  @HiveField(8)
  String? pullsUrl;

  @HiveField(9)
  DateTime? createdAt;

  @HiveField(10)
  DateTime? updatedAt;

  @HiveField(11)
  DateTime? pushedAt;

  @HiveField(12)
  String? gitUrl;

  @HiveField(13)
  String? sshUrl;

  @HiveField(14)
  String? cloneUrl;

  @HiveField(15)
  String? svnUrl;

  @HiveField(16)
  String? homepage;

  @HiveField(17)
  List<String>? topics;

  @HiveField(18)
  String? visibility;

  @HiveField(19)
  int? forks;

  @HiveField(20)
  int? openIssues;

  @HiveField(21)
  int? watchers;

  @HiveField(22)
  String? defaultBranch;

  @HiveField(23)
  double? score;

  RepositoryItem({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.description,
    this.private,
    this.owner,
    this.url,
    this.pullsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  factory RepositoryItem.fromJson(Map<String, dynamic> json) => RepositoryItem(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        description: json["description"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        url: json["url"],
        pullsUrl: json["pulls_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pushedAt: json["pushed_at"] == null
            ? null
            : DateTime.parse(json["pushed_at"]),
        gitUrl: json["git_url"],
        sshUrl: json["ssh_url"],
        cloneUrl: json["clone_url"],
        svnUrl: json["svn_url"],
        homepage: json["homepage"],
        topics: json["topics"] == null
            ? []
            : List<String>.from(json["topics"]!.map((x) => x)),
        visibility: json["visibility"],
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        defaultBranch: json["default_branch"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "description": description,
        "private": private,
        "owner": owner?.toJson(),
        "url": url,
        "pulls_url": pullsUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pushed_at": pushedAt?.toIso8601String(),
        "git_url": gitUrl,
        "ssh_url": sshUrl,
        "clone_url": cloneUrl,
        "svn_url": svnUrl,
        "homepage": homepage,
        "topics":
            topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
        "visibility": visibility,
        "forks": forks,
        "open_issues": openIssues,
        "watchers": watchers,
        "default_branch": defaultBranch,
        "score": score,
      };
}

@HiveType(typeId: 1)
class Owner extends HiveObject {
  @HiveField(0)
  String? login;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? nodeId;

  @HiveField(3)
  String? avatarUrl;

  @HiveField(4)
  String? gravatarId;

  @HiveField(5)
  String? url;

  @HiveField(6)
  String? htmlUrl;

  @HiveField(7)
  String? followersUrl;

  @HiveField(8)
  String? followingUrl;

  @HiveField(9)
  String? gistsUrl;

  @HiveField(10)
  String? starredUrl;

  @HiveField(11)
  String? subscriptionsUrl;

  @HiveField(12)
  String? organizationsUrl;

  @HiveField(13)
  String? reposUrl;

  @HiveField(14)
  String? eventsUrl;

  @HiveField(15)
  String? receivedEventsUrl;

  @HiveField(16)
  String? type;

  @HiveField(17)
  bool? siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}
