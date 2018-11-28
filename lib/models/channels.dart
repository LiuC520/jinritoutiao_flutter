import 'package:base_architecture/uuid.dart';

import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
class Channels {
  final String id;
  final String name; //频道名字
  final bool isInUsed; //是否在我的频道中使用

  Channels({String name, String id, bool isInUsed})
      : this.id = id ?? Uuid().generateV4(),
        this.name = name ?? '',
        this.isInUsed = isInUsed ?? false;

  Channels copyWith({String name, String id, bool isInUsed}) {
    return Channels(
      id: id ?? this.id,
      name: name ?? this.name,
      isInUsed: isInUsed ?? this.isInUsed,
    );
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isInUsed.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Channels &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          isInUsed == other.isInUsed;

  @override
  String toString() {
    return 'Channels{id: $id, name: $name, isInUsed:$isInUsed}';
  }

/**
 * 变成实体
 */
  ChannelsEntity toEntity() {
    return ChannelsEntity(id, name, isInUsed);
  }

/***
 * 从实体中获取实体
 */
  static Channels fromEntity(ChannelsEntity entity) {
    return Channels(
        id: entity.id, name: entity.name, isInUsed: entity.isInUsed);
  }
}
