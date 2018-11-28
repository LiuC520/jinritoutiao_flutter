import 'package:flutter/material.dart';
import 'package:gesture_password/gesture_password.dart';
import 'package:gesture_password/mini_gesture_password.dart';

/**
 * 手势密码
 */
class Gesture extends StatefulWidget {
  Gesture({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Gesture> {
  GlobalKey<MiniGesturePasswordState> miniGesturePassword =
      new GlobalKey<MiniGesturePasswordState>();

  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Column(
        children: <Widget>[
          // new Center(
          //     child: new MiniGesturePassword(key: miniGesturePassword)),
          new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return new Container(
                child: new GesturePassword(
                  attribute: ItemAttribute(
                      normalColor: Colors.grey, selectedColor: Colors.red),
                  width: 200.0,
                  successCallback: (s) {
                    print("successCallback$s");
                    scaffoldState.currentState?.showSnackBar(
                        new SnackBar(content: new Text('successCallback:$s')));
                    miniGesturePassword.currentState?.setSelected('');
                  },
                  failCallback: () {
                    print('failCallback');
                    scaffoldState.currentState?.showSnackBar(
                        new SnackBar(content: new Text('failCallback')));
                    miniGesturePassword.currentState?.setSelected('');
                  },
                  selectedCallback: (str) {
                    miniGesturePassword.currentState?.setSelected(str);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
