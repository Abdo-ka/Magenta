// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Line extends StatefulWidget {
  const Line({super.key});

  @override
  State<StatefulWidget> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  Animation<double>? animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    animation = Tween(begin: 0.7, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {
          _progress = animation!.value;
        });
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LinePainter(_progress));
  }
}

class LinePainter extends CustomPainter {
  Paint _paint = Paint();
  final double _progress;

  LinePainter(this._progress) {
    _paint = Paint()
      ..color = const Color(0xFFFF0090)
      ..strokeWidth = 1.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        const Offset(0.0, 0.0),
        Offset(size.width - size.width * _progress,
            size.height - size.height * _progress),
        _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}
