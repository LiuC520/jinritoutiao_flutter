// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:todos_repository/todos_repository.dart';

/// Loads and saves a List of Todos using a text file stored on the device.
///
/// Note: This class has no direct dependencies on any Flutter dependencies.
/// Instead, the `getDirectory` method should be injected. This allows for
/// testing.
class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  FileStorage(
    this.tag,
    this.getDirectory,
  );

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir.path}/ArchSampleStorage_$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }

  /**
   * 这是加载todo的东西
   */
  Future<List<TodoEntity>> loadTodos() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final todos = (json['todos'])
        .map<TodoEntity>((todo) => TodoEntity.fromJson(todo))
        .toList();

    return todos;
  }

  Future<File> saveTodos(List<TodoEntity> todos) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'todos': todos.map((todo) => todo.toJson()).toList(),
    }));
  }

/**
 * 这是加载频道列表的
 * 也就是读取文件的channels字段，然后解析出json成list
 */
  Future<List<ChannelsEntity>> loadChannels() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final channels = (json['channels'])
        .map<ChannelsEntity>((channel) => ChannelsEntity.fromJson(channel))
        .toList();

    return channels;
  }

/**
 * 这是把数据存储到文件中
 * 拿到list，把list的每一项转换成json
 * 然后转换成数组，
 * 最后用json转换成json字符串存储在文件中
 */
  Future<File> saveChannels(List<ChannelsEntity> channels) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      'channels': channels.map((channel) => channel.toJson()).toList(),
    }));
  }
}
