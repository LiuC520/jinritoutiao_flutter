import 'dart:async';
import 'dart:core';
import './ChannelsEntity.dart';

/**
 * 加载和保存频道
 */
abstract class ChannelsRepository {
  /**
   * 第一次加载频道列表，从文件村存储中加载
   * 如果加载失败可以从web加载或者返回空的数组
   */
  Future<List<ChannelsEntity>> loadChannels();
  /**
   * 保存频道数据到本地硬盘或者web
   */
  Future saveChannel(List<ChannelsEntity> channels);
}
