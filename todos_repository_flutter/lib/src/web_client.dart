// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:todos_repository/todos_repository.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting Todos to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
class WebClient {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

/**
 * 获取频道列表数据，从网络上获取，此处为模拟数据
 */
  Future<List<ChannelsEntity>> fetchChannels() async {
    return Future.delayed(
        delay,
        () => [
              ChannelsEntity('1', '关注', true),
              ChannelsEntity('2', '推荐', true),
              ChannelsEntity('3', '党媒推荐', false),
              ChannelsEntity('4', '懂车帝', false),
              ChannelsEntity('5', '科技', false),
              ChannelsEntity('6', '精品课', false),
              ChannelsEntity('7', '视频', false),
              ChannelsEntity('8', '热点', false),
              ChannelsEntity('9', '图片', false),
              ChannelsEntity('10', '娱乐', false),
              ChannelsEntity('11', '特卖', false),
              ChannelsEntity('12', '财经', false),
              ChannelsEntity('13', '房产', false),
              ChannelsEntity('14', '军事', false),
              ChannelsEntity('15', '体育', false),
              ChannelsEntity('16', '小视频', false),
              ChannelsEntity('17', '育儿', false),
              ChannelsEntity('18', '健康', false),
              ChannelsEntity('19', '直播', false),
              ChannelsEntity('20', '小说', false),
              ChannelsEntity('21', '音频', false),
              ChannelsEntity('22', '上海', false),
              ChannelsEntity('23', '国际', false),
              ChannelsEntity('24', '国风', false),
              ChannelsEntity('25', '时尚', false),
              ChannelsEntity('26', '历史', false),
              ChannelsEntity('27', '搞笑', false),
              ChannelsEntity('28', '数码', false),
              ChannelsEntity('29', '美食', false),
              ChannelsEntity('30', '养生', false),
              ChannelsEntity('31', '电影', false),
              ChannelsEntity('32', '手机', false),
              ChannelsEntity('33', '旅游', false),
              ChannelsEntity('34', '宠物', false),
              ChannelsEntity('35', '情感', false),
              ChannelsEntity('36', '家居', false),
              ChannelsEntity('37', '教育', false),
              ChannelsEntity('38', '三农', false),
              ChannelsEntity('39', '孕产', false),
              ChannelsEntity('40', '文化', false),
              ChannelsEntity('41', '游戏', false),
              ChannelsEntity('42', '股票', false),
              ChannelsEntity('43', '科学', false),
              ChannelsEntity('44', '动漫', false),
              ChannelsEntity('45', '故事', false),
              ChannelsEntity('46', '收藏', false),
              ChannelsEntity('47', '精选', false),
              ChannelsEntity('48', '星座', false),
              ChannelsEntity('49', '辟谣', false),
              ChannelsEntity('50', '正能量', false),
              ChannelsEntity('51', '生活', false),
              ChannelsEntity('52', '中国新唱将', false),
              ChannelsEntity('53', '问答', false),
              ChannelsEntity('54', '微头条', false),
              ChannelsEntity('55', '失信曝光台', false),
              ChannelsEntity('56', '传媒', false),
              ChannelsEntity('57', '新时代', false),
              ChannelsEntity('58', '彩票', false),
              ChannelsEntity('59', '放心购', false),
              ChannelsEntity('60', '公益', false),
              ChannelsEntity('61', '冬奥', false),
            ]);
  }

/**
 * 模拟返回的成功还是失败，这里就固定死是成功的
 */
  Future<bool> postChannels(List<ChannelsEntity> channels) async {
    return Future.value(true);
  }

  /// Mock that "fetches" some Todos from a "web service" after a short delay
  Future<List<TodoEntity>> fetchTodos() async {
    return Future.delayed(
        delay,
        () => [
              TodoEntity(
                'Buy food for da kitty',
                '1',
                'With the chickeny bits!',
                false,
              ),
              TodoEntity(
                'Find a Red Sea dive trip',
                '2',
                'Echo vs MY Dream',
                false,
              ),
              TodoEntity(
                'Book flights to Egypt',
                '3',
                '',
                true,
              ),
              TodoEntity(
                'Decide on accommodation',
                '4',
                '',
                false,
              ),
              TodoEntity(
                'Sip Margaritas',
                '5',
                'on the beach',
                true,
              ),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postTodos(List<TodoEntity> todos) async {
    return Future.value(true);
  }
}
