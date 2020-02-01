import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:angles/angles.dart';

class PinkClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 1.4);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 1.8);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LogInClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var topRightA = Angle.fromDegrees(0.0);
    var topRightB = Angle.fromDegrees(-90.0);
    var topLeftA = Angle.fromDegrees(90.0);
    var topLeftB = Angle.fromDegrees(-280.0);
    var bottomLeftA = Angle.fromDegrees(180.0);
    var bottomLeftB = Angle.fromDegrees(-180.0);
    Paint complete = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    Path path = Path();
    path.moveTo(0.0, 32);
    path.lineTo(0.0, size.height * 0.7);
    path.lineTo(size.width - 10, size.height - 10);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 10);
//    path.arcTo(
//      new Rect.fromCircle(
//          center: Offset(size.width - 20, size.height - 30), radius: 30.0),
//      bottomLeftA.radians,
//      bottomLeftB.radians,
//      false,
//    );
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, 38);
    path.arcTo(
      new Rect.fromCircle(center: Offset(size.width - 32, 38), radius: 30.0),
      topRightA.radians,
      topRightB.radians,
      false,
    );
    path.lineTo(32, 8);
    path.arcTo(
      new Rect.fromCircle(center: Offset(32, 38), radius: 30.0),
      topLeftA.radians,
      topLeftB.radians,
      false,
    );
//    canvas.drawArc(
//        new Rect.fromCircle(
//            center: Offset(size.width - 20, size.height - 40), radius: 30.0),
//        bottomLeftA.radians,
//        bottomLeftB.radians,
//        false,
//        complete);
//    path.moveTo(size.width, size.height * 0.14);
//    path.lineTo(size.width, size.height * 1.0);
//    path.lineTo(size.width - (size.width * 0.99), size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
