// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:jinritoutiao/actions/actions.dart';
import 'package:jinritoutiao/models/models.dart';
import 'package:jinritoutiao/selectors/selectors.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:todos_repository_flutter/todos_repository_flutter.dart';

List<Middleware<AppState>> createStoreTodosMiddleware() {
  TodosRepositoryFlutter repository = TodosRepositoryFlutter(
    fileStorage: FileStorage(
      '_redux_app_',
      getApplicationDocumentsDirectory,
    ),
  );

  RepositoryFlutter channelsRepository = RepositoryFlutter(
    fileStorage: FileStorage(
      '_redux_app1_',
      getApplicationDocumentsDirectory,
    ),
  );

  final initChannels = _initChannels(channelsRepository);
  final saveChannels = _saveChannels(channelsRepository);

  final saveTodos = _createSaveTodos(repository);
  final loadTodos = _createLoadTodos(repository);

  return [
    /**
     *第一次 初始化数据
     */
    TypedMiddleware<AppState, FirstChannelsAction>(initChannels),
    TypedMiddleware<AppState, InitChannlesAction>(saveChannels),
    /**
     * 更新保存数据，
     * 就是更新了store的内容就自动保存文件，用中间件来操作的
     */
    TypedMiddleware<AppState, UpdateChannlesAction>(saveChannels),

    /**
     * 下面是旧的
    */
    TypedMiddleware<AppState, LoadTodosAction>(loadTodos),
    TypedMiddleware<AppState, AddTodoAction>(saveTodos),
    TypedMiddleware<AppState, ClearCompletedAction>(saveTodos),
    TypedMiddleware<AppState, ToggleAllAction>(saveTodos),
    TypedMiddleware<AppState, UpdateTodoAction>(saveTodos),
    TypedMiddleware<AppState, TodosLoadedAction>(saveTodos),
    TypedMiddleware<AppState, DeleteTodoAction>(saveTodos),
  ];
}

/**
 * 初始化channels的值,从文件或者缓存中获取数据
 */
Middleware<AppState> _initChannels(ChannelsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadChannels().then((channels) {
      print('初始化数据-->$channels');

      store.dispatch(
          InitChannlesAction(channels.map(Channels.fromEntity).toList()));
    }).catchError((_) => null);

    next(action);
  };
}
/**
 * 操作完了之后，保存数据，保存数据
 * 保存到文件或者缓存上或者网络上
 * 文件源是store的state里面的channels 转换成实体再转换成数组
 */

Middleware<AppState> _saveChannels(ChannelsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    repository.saveChannel(getChannelsSelector(store.state)
        .map((channel) => channel.toEntity())
        .toList());
  };
}

/**
 * 旧的
 */
Middleware<AppState> _createSaveTodos(TodosRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveTodos(
      todosSelector(store.state).map((todo) => todo.toEntity()).toList(),
    );
  };
}

Middleware<AppState> _createLoadTodos(TodosRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadTodos().then(
      (todos) {
        store.dispatch(
          TodosLoadedAction(
            todos.map(Todo.fromEntity).toList(),
          ),
        );
      },
    ).catchError((_) => store.dispatch(TodosNotLoadedAction()));

    next(action);
  };
}
