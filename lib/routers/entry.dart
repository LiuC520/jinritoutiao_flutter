import 'package:flutter/material.dart';
import 'dart:ui';
import './home/index.dart';

import 'package:flutter_custom_bottom_tab_bar/eachtab.dart';

import 'package:base_architecture/base_architecture.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:jinritoutiao/actions/actions.dart';
import 'package:jinritoutiao/models/models.dart';

/**
 * bottomNavigationBar不使用BottomTabBar而使用自定义的TabBar
 * 因为BottomTabBar的点击事件会改变state来改变body的内容，改变这个会刷新页面，比较慢，还是用自定义的tabbar，会比较快些
 */

class Entry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EntryState();
  }
}

class EntryState extends State<Entry> with SingleTickerProviderStateMixin {
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];
  TabController controller;
  @override
  void initState() {
    super.initState();
  }

  getController(vm) {
    if (controller == null) {
      controller = new TabController(vsync: this, initialIndex: 0, length: 5);
      controller.addListener(() {
        vm.onTabSelected(controller.index);
        // setState(() => _selectedIndex = _tabController.index);
        print("liucheng-> ${controller.index}");
      });
    }
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (Store<AppState> store) =>
            StoreProvider.of<AppState>(context).dispatch(FirstChannelsAction()),
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return Scaffold(
            bottomNavigationBar: Container(
              height: 46,
              child: Column(
                children: <Widget>[
                  Divider(
                    height: 2,
                  ),
                  new TabBar(
                    isScrollable: false,
                    controller: getController(vm),
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.red,
                    labelPadding: EdgeInsets.all(0),
                    unselectedLabelColor: Colors.black,
                    tabs: <Widget>[
                      EachTab(
                          width: 70,
                          badgeNo: '12',
                          badgeColor: Colors.red,
                          height: 40,
                          padding: EdgeInsets.all(0),
                          icon: vm.selectedTab == 0
                              ? Image.asset(
                                  'assets/imgs/tab_home_selected.png',
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  'assets/imgs/tab_home.png',
                                  width: 20,
                                  height: 20,
                                ),
                          text: ArchSampleLocalizations.of(context).homeTab,
                          iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          textStyle: TextStyle(fontSize: 10)),
                      EachTab(
                          height: 40,
                          padding: EdgeInsets.all(0),
                          icon: vm.selectedTab == 1
                              ? Image.asset(
                                  'assets/imgs/tab_xigua_selected.png',
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  'assets/imgs/tab_xigua.png',
                                  width: 20,
                                  height: 20,
                                ),
                          text:
                              ArchSampleLocalizations.of(context).xiguaVideoTab,
                          iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          textStyle: TextStyle(fontSize: 10)),
                      EachTab(
                          height: 40,
                          padding: EdgeInsets.all(0),
                          icon: vm.selectedTab == 2
                              ? Image.asset(
                                  'assets/imgs/tab_find_selected.png',
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  'assets/imgs/tab_find.png',
                                  width: 20,
                                  height: 20,
                                ),
                          text: ArchSampleLocalizations.of(context).findTab,
                          iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          textStyle: TextStyle(fontSize: 10)),
                      EachTab(
                          height: 40,
                          padding: EdgeInsets.all(0),
                          icon: vm.selectedTab == 3
                              ? Image.asset(
                                  'assets/imgs/tab_video_selected.png',
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  'assets/imgs/tab_video.png',
                                  width: 20,
                                  height: 20,
                                ),
                          text: ArchSampleLocalizations.of(context)
                              .littleVideoTab,
                          iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          textStyle: TextStyle(fontSize: 10)),
                      EachTab(
                          height: 40,
                          padding: EdgeInsets.all(0),
                          icon: vm.selectedTab == 4
                              ? Image.asset(
                                  'assets/imgs/tab_me_selected.png',
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  'assets/imgs/tab_me.png',
                                  width: 20,
                                  height: 20,
                                ),
                          text: ArchSampleLocalizations.of(context).myTab,
                          iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          textStyle: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(), //设置滑动的效果，这个禁用滑动
              controller: getController(vm),
              children: <Widget>[
                Home(),
                Text(ArchSampleLocalizations.of(context).xiguaVideoTab),
                Text(ArchSampleLocalizations.of(context).findTab),
                Text(ArchSampleLocalizations.of(context).littleVideoTab),
                Text(ArchSampleLocalizations.of(context).myTab),
              ],
            ),
          );
        });
  }
}

class _ViewModel {
  final int selectedTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.selectedTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        selectedTab: store.state.selectedTab,
        onTabSelected: (index) {
          store.dispatch(UpdateSeletedTabAction(index));
        });
  }
}
