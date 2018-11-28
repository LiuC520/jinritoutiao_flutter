// Copyright 2018 刘成 Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:jinritoutiao/models/models.dart';

/**
 * 底部导航改变了
 */
class TabChange {
  final int selectedIndex;
  TabChange(this.selectedIndex);

  @override
  String toString() {
    return 'Tab改变了-> $selectedIndex';
  }
}

/**
 * 按下了哪一个tab
 * 这里的index是tab的index   从 0 开始
 */
/**
 * redux-2、action
 * 携带新的参数
 */
class UpdateSeletedTabAction {
  final int newSelectedTab;

  UpdateSeletedTabAction(this.newSelectedTab);

  @override
  String toString() {
    return 'UpdateSeletedTabAction{newSelectedTab: $newSelectedTab}';
  }
}

/**
 * 第一次初始化数据
 */
class FirstChannelsAction {}

/**
 * 初始化频道数据
 */
class InitChannlesAction {
  final List<Channels> channles;
  InitChannlesAction(this.channles);

  @override
  String toString() {
    return 'InitChannlesAction:{channels: $InitChannlesAction}';
  }
}

/**
 * 更新频道数据
 */
class UpdateChannlesAction {
  final Channels channel;
  final String id;
  UpdateChannlesAction(this.id, this.channel);

  @override
  String toString() {
    return 'UpdateChannlesAction{id: $id, channel: $channel}';
  }
}

class ClearCompletedAction {}

class ToggleAllAction {}

class LoadTodosAction {}

class TodosNotLoadedAction {}

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);

  @override
  String toString() {
    return 'TodosLoadedAction{todos: $todos}';
  }
}

class UpdateTodoAction {
  final String id;
  final Todo updatedTodo;

  UpdateTodoAction(this.id, this.updatedTodo);

  @override
  String toString() {
    return 'UpdateTodoAction{id: $id, updatedTodo: $updatedTodo}';
  }
}

class DeleteTodoAction {
  final String id;

  DeleteTodoAction(this.id);

  @override
  String toString() {
    return 'DeleteTodoAction{id: $id}';
  }
}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);

  @override
  String toString() {
    return 'AddTodoAction{todo: $todo}';
  }
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;

  UpdateFilterAction(this.newFilter);

  @override
  String toString() {
    return 'UpdateFilterAction{newFilter: $newFilter}';
  }
}
/**
 * 也是按下了哪一个tab
 * 这个apptab是个枚举
 */

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}
