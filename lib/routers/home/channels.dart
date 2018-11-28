import 'package:flutter/material.dart';
import 'package:jinritoutiao/rewrite/bottom_sheet.dart' as sheet;
import './SheetWithButtons.dart';
import 'dart:ui';

class Channels {
  mainBottom(BuildContext context) {
    sheet.showModalBottomSheet(
        maxHeight: MediaQueryData.fromWindow(window).size.height -
            MediaQueryData.fromWindow(window).padding.top,
        context: context,
        builder: (BuildContext context) {
          return SheetWithButtons(1);
        },
        routeTransitionsBuilder: _buildRouteTransitions);
  }

  static Widget _buildRouteTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return
        // RotationTransition(
        //   child: child,
        //   turns: Tween<double>(begin: 0, end: 360).animate(animation),
        //   alignment: Alignment.topRight,
        // );
        ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(animation),
      child: child,
    );
    // SlideTransition(
    //   position: new Tween<Offset>(
    //     begin: const Offset(1, 0),
    //     end: const Offset(0.0, 0.0),
    //   ).animate(animation),
    //   child: child,
    // );
    //     SizeTransition(
    //   sizeFactor: Tween<double>(begin: -1.0, end: 1.0).animate(animation),
    //   axis: Axis.horizontal,
    //   axisAlignment: 1.0,
    //   // new CurvedAnimation(parent: animation, curve: Curves.bounceInOut),
    //   child: child,
    // );

    // new FadeTransition(
    //   opacity: new CurvedAnimation(
    //     parent: animation,
    //     curve: Curves.easeOut,
    //   ),
    //   child: child,
    // );
  }
}
