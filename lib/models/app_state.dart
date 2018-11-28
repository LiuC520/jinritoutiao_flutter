// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:jinritoutiao/models/models.dart';

/**
 * redux-1、整个state树
 */
@immutable
class AppState {
  final bool isLoading;
  final List<Todo> todos;
  final int selectedTab;
  final AppTab activeTab;
  final VisibilityFilter activeFilter;
  final List<Channels> channles; //频道列表

  AppState(
      {this.isLoading = false,
      this.todos = const [],
      this.activeTab = AppTab.todos,
      this.activeFilter = VisibilityFilter.all,
      this.selectedTab = 0,
      this.channles});

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith(
      {bool isLoading,
      List<Todo> todos,
      AppTab activeTab,
      VisibilityFilter activeFilter,
      int selectedTab,
      List<Channels> channles}) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
      activeTab: activeTab ?? this.activeTab,
      activeFilter: activeFilter ?? this.activeFilter,
      selectedTab: selectedTab ?? this.selectedTab,
      channles: channles ?? this.channles,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      todos.hashCode ^
      activeTab.hashCode ^
      activeFilter.hashCode ^
      selectedTab.hashCode ^
      channles.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          todos == other.todos &&
          activeTab == other.activeTab &&
          activeFilter == other.activeFilter &&
          selectedTab == other.selectedTab &&
          channles == other.channles;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, todos: $todos, activeTab: $activeTab, activeFilter: $activeFilter, selectedTab: $selectedTab, channles: $channles,}';
  }
}
