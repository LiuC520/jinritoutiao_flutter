import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:jinritoutiao/widgets/wrong.dart';
import './channels/SortableGridView.dart';
import 'package:jinritoutiao/widgets/flutter_list_drag_and_drop/drag_and_drop_list.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:jinritoutiao/models/models.dart';

class SheetWithButtons extends StatelessWidget {
  final List<String> items = List<String>();
  /**
   * 这是我的频道的哪一个被选中了
   */
  final int slectedTab;

  SheetWithButtons(this.slectedTab);
  @override
  Widget build(BuildContext context) {
    for (int x = 0; x < 20; x++) {
      items.add("x = $x");
    }
    return StoreConnector<AppState, List<Channels>>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.channles,
      builder: (context, vm) {
        print('长度-》  ${vm}');
        return Container(
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: new Container(
                height: MediaQueryData.fromWindow(window).size.height -
                    MediaQueryData.fromWindow(window).padding.top,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: SizedBox.fromSize(
                              size: Size(18, 18),
                              child: CustomPaint(
                                painter: WrongPaint(size: 18, lineWidth: 2),
                              ),
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  "我的频道",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  "点击进入我的频道",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Text(
                              "编辑",
                              style: TextStyle(color: Colors.red),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 1, color: Colors.red),
                                  right:
                                      BorderSide(width: 1, color: Colors.red),
                                  left: BorderSide(width: 1, color: Colors.red),
                                  bottom:
                                      BorderSide(width: 1, color: Colors.red),
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                      Container(
                        height: 300,
                        padding: EdgeInsets.all(8),
                        child: SortableGridView(
                          items,
                          childAspectRatio: 3.0, //宽高3比1
                          crossAxisCount: 4, //3列
                          scrollDirection: Axis.vertical, //竖向滑动
                          canAccept: (oldIndex, newIndex) {
                            return true;
                          },
                          itemBuilder: (context, data) {
                            return Card(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Center(
                                child: Text(data),
                              ),
                            ));
                          },
                        ),
                      )
                    ])
                //     new DragAndDropList<String>(
                //   items,
                //   itemBuilder: (BuildContext context, item) {
                //     return new SizedBox(
                //       child: new Card(
                //         child: new ListTile(
                //           title: new Text(item),
                //         ),
                //       ),
                //     );
                //   },
                //   onDragFinish: (before, after) {
                //     String data = items[before];
                //     items.removeAt(before);
                //     items.insert(after, data);
                //   },
                //   canBeDraggedTo: (one, two) => true,
                //   dragElevation: 8.0,
                //   // ),
                //   // Container(
                //   //   child: Text("data"),
                //   //   color: Colors.green,
                //   // ),
                // ],
                // ),
                ));
      },
    );

    ;
  }
}
