// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:todos_repository_flutter/todos_repository_flutter.dart';

/**
 * 加载数据
 * 存储数据的具体实现，缓存
 */
class RepositoryFlutter implements ChannelsRepository {
  final FileStorage fileStorage;
  final WebClient webClient;
  const RepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  @override
  Future<List<ChannelsEntity>> loadChannels() async {
    try {
      return await fileStorage.loadChannels();
    } catch (e) {
      final channels = await webClient.fetchChannels();
      fileStorage.saveChannels(channels);
      return channels;
    }
  }

  @override
  Future saveChannel(List<ChannelsEntity> channels) {
    return Future.wait<dynamic>([
      fileStorage.saveChannels(channels),
      webClient.postChannels(channels),
    ]);
  }
}

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Todos and Persist todos.
class TodosRepositoryFlutter implements TodosRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const TodosRepositoryFlutter({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  @override
  Future<List<TodoEntity>> loadTodos() async {
    try {
      return await fileStorage.loadTodos();
    } catch (e) {
      final todos = await webClient.fetchTodos();
      fileStorage.saveTodos(todos);
      return todos;
    }
  }

  // Persists todos to local disk and the web
  @override
  Future saveTodos(List<TodoEntity> todos) {
    return Future.wait<dynamic>([
      fileStorage.saveTodos(todos),
      webClient.postTodos(todos),
    ]);
  }
}
