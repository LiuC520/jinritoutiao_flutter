import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:jinritoutiao/models/models.dart';

/**
 * redux-5、统一下widget
 * 当然也可以不用，直接在页面上写下面的代码
 */
class SelectedTab extends StatelessWidget {
  final ViewModelBuilder<int> builder;

  SelectedTab({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.selectedTab,
      builder: builder,
    );
  }
}
