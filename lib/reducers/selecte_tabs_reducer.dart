import 'package:redux/redux.dart';
import 'package:jinritoutiao/actions/actions.dart';

/**
 * redux-3、reducer
 * 返回新的state的index
 * 这个新的index是通过action传过来的
 */
final selectedTabsReducer = combineReducers<int>(
    [TypedReducer<int, UpdateSeletedTabAction>(_selectedTabReducer)]);

int _selectedTabReducer(int selectedTab, UpdateSeletedTabAction action) {
  return action.newSelectedTab;
}
