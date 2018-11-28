// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:jinritoutiao/models/models.dart';
import 'package:jinritoutiao/reducers/loading_reducer.dart';
import 'package:jinritoutiao/reducers/tabs_reducer.dart';
import 'package:jinritoutiao/reducers/todos_reducer.dart';
import 'package:jinritoutiao/reducers/visibility_reducer.dart';
import 'package:jinritoutiao/reducers/selecte_tabs_reducer.dart';
import 'package:jinritoutiao/reducers/channels_reducer.dart';
// We create the State reducer by combining many smaller reducers into one!

/**
 * redux-4、合并reducer
 * 拿到小reducer的结构给根reducer，返回新的state树
 */
AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    todos: todosReducer(state.todos, action),
    activeFilter: visibilityReducer(state.activeFilter, action),
    activeTab: tabsReducer(state.activeTab, action),
    selectedTab: selectedTabsReducer(state.selectedTab, action),
    channles: channelsReducer(state.channles, action),
  );
}
