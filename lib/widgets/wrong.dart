import 'package:flutter/material.dart';

class WrongPaint extends CustomPainter {
/**
 *  宽高大小
 */
  final double size;
  final Color lineColor;
  final double lineWidth;
  final Function onTap;
  WrongPaint(
      {this.size = 20,
      this.lineColor = Colors.black,
      this.lineWidth = 4,
      this.onTap = null});

  @override
  paint(Canvas canvas, Size size) {
    final line1Paint = new Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = this.lineWidth;

    final reactPaint = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, this.size, this.size), reactPaint);
    canvas.drawLine(Offset(0, 0), Offset(this.size, this.size), line1Paint);
    canvas.drawLine(Offset(this.size, 0), Offset(0, this.size), line1Paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
