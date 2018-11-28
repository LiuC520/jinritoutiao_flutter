class ChannelsEntity {
  final String id;
  final String name;
  final bool isInUsed; //是否在我的频道中使用

  ChannelsEntity(this.id, this.name, this.isInUsed);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isInUsed.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelsEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          isInUsed == other.isInUsed;

  @override
  String toString() {
    return 'ChannelsEntity{id: $id, name: $name, isInUsed $isInUsed}';
  }

  /**
   * 变成json
   */
  Map<String, Object> toJson() {
    return {"id": id, "name": name, "isInUsed": isInUsed};
  }

/**
 * 从josn转换成实体
 */
  static ChannelsEntity fromJson(Map<String, Object> json) {
    return ChannelsEntity(
        json['id'] as String, json['name'] as String, json['isInUsed'] as bool);
  }
}
