// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_list_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepositoryItemAdapter extends TypeAdapter<RepositoryItem> {
  @override
  final int typeId = 0;

  @override
  RepositoryItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepositoryItem(
      id: fields[0] as int?,
      nodeId: fields[1] as String?,
      name: fields[2] as String?,
      fullName: fields[3] as String?,
      description: fields[6] as String?,
      private: fields[4] as bool?,
      owner: fields[5] as Owner?,
      url: fields[7] as String?,
      pullsUrl: fields[8] as String?,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
      pushedAt: fields[11] as DateTime?,
      gitUrl: fields[12] as String?,
      sshUrl: fields[13] as String?,
      cloneUrl: fields[14] as String?,
      svnUrl: fields[15] as String?,
      homepage: fields[16] as String?,
      topics: (fields[17] as List?)?.cast<String>(),
      visibility: fields[18] as String?,
      forks: fields[19] as int?,
      openIssues: fields[20] as int?,
      watchers: fields[21] as int?,
      defaultBranch: fields[22] as String?,
      score: fields[23] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RepositoryItem obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nodeId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.private)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(8)
      ..write(obj.pullsUrl)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.pushedAt)
      ..writeByte(12)
      ..write(obj.gitUrl)
      ..writeByte(13)
      ..write(obj.sshUrl)
      ..writeByte(14)
      ..write(obj.cloneUrl)
      ..writeByte(15)
      ..write(obj.svnUrl)
      ..writeByte(16)
      ..write(obj.homepage)
      ..writeByte(17)
      ..write(obj.topics)
      ..writeByte(18)
      ..write(obj.visibility)
      ..writeByte(19)
      ..write(obj.forks)
      ..writeByte(20)
      ..write(obj.openIssues)
      ..writeByte(21)
      ..write(obj.watchers)
      ..writeByte(22)
      ..write(obj.defaultBranch)
      ..writeByte(23)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 1;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner(
      login: fields[0] as String?,
      id: fields[1] as int?,
      nodeId: fields[2] as String?,
      avatarUrl: fields[3] as String?,
      gravatarId: fields[4] as String?,
      url: fields[5] as String?,
      htmlUrl: fields[6] as String?,
      followersUrl: fields[7] as String?,
      followingUrl: fields[8] as String?,
      gistsUrl: fields[9] as String?,
      starredUrl: fields[10] as String?,
      subscriptionsUrl: fields[11] as String?,
      organizationsUrl: fields[12] as String?,
      reposUrl: fields[13] as String?,
      eventsUrl: fields[14] as String?,
      receivedEventsUrl: fields[15] as String?,
      type: fields[16] as String?,
      siteAdmin: fields[17] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.nodeId)
      ..writeByte(3)
      ..write(obj.avatarUrl)
      ..writeByte(4)
      ..write(obj.gravatarId)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.htmlUrl)
      ..writeByte(7)
      ..write(obj.followersUrl)
      ..writeByte(8)
      ..write(obj.followingUrl)
      ..writeByte(9)
      ..write(obj.gistsUrl)
      ..writeByte(10)
      ..write(obj.starredUrl)
      ..writeByte(11)
      ..write(obj.subscriptionsUrl)
      ..writeByte(12)
      ..write(obj.organizationsUrl)
      ..writeByte(13)
      ..write(obj.reposUrl)
      ..writeByte(14)
      ..write(obj.eventsUrl)
      ..writeByte(15)
      ..write(obj.receivedEventsUrl)
      ..writeByte(16)
      ..write(obj.type)
      ..writeByte(17)
      ..write(obj.siteAdmin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
