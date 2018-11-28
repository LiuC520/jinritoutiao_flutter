import 'package:redux/redux.dart';
import 'package:jinritoutiao/actions/actions.dart';
import 'package:jinritoutiao/models/models.dart';

final channelsReducer = combineReducers<List<Channels>>([
  TypedReducer<List<Channels>, InitChannlesAction>(_initChannelsData),
  TypedReducer<List<Channels>, UpdateChannlesAction>(_updateChannels),
]);

/**
 * 初始化数据
 */
List<Channels> _initChannelsData(
    List<Channels> data, InitChannlesAction action) {
  return action.channles;
}

/**
 * 更新数据，从action里面拿到新的数据更新下数据源
 */
List<Channels> _updateChannels(
    List<Channels> data, UpdateChannlesAction action) {
  return data
      .map((channel) => channel.id == action.id ? action.channel : channel)
      .toList();
}
