import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineTabIndicator extends Decoration {
  final Color color;
  double radius;

  LineTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _LinePainter(color: color, radius: radius);
  }
}

class _LinePainter extends BoxPainter {
  final Color color;
  double radius;

  _LinePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    _paint.strokeCap = StrokeCap.round;
    _paint.strokeWidth = 5.h;
    final Offset startLine = Offset(
        configuration.size!.width * 1/6,
        configuration.size!.height * 0.8);
    final Offset endLine = Offset(
        configuration.size!.width * 5/6,
        configuration.size!.height * 0.8);
    canvas.drawLine(offset + startLine, offset + endLine, _paint);
  }
}
