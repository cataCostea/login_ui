import 'package:flutter/material.dart';
import 'package:angles/angles.dart';

class SignInPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var topRightA = Angle.fromDegrees(0.0);
    var topRightB = Angle.fromDegrees(-90.0);
    var topLeftA = Angle.fromDegrees(-90.0);
    var topLeftB = Angle.fromDegrees(-90.0);

    Paint complete = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    Path path = Path();
    path.moveTo(0.0, 32);
    path.lineTo(0.0, (size.height * 0.7) - 20);
    path.quadraticBezierTo(
        2.0, (size.height * 0.7), 15, (size.height * 0.7) + 5);
    path.lineTo(size.width - 30, size.height - 25);
    path.quadraticBezierTo(
        size.width - 3, size.height - 17, size.width, size.height - 40);
    path.lineTo(size.width, 38);
    path.arcTo(
      Rect.fromCircle(center: Offset(size.width - 30, 38), radius: 30.0),
      topRightA.radians,
      topRightB.radians,
      false,
    );
    path.lineTo(32, 8);
    path.arcTo(
      Rect.fromCircle(center: Offset(30, 38), radius: 30.0),
      topLeftA.radians,
      topLeftB.radians,
      false,
    );
    path.close();

    Path shadowPath = Path();
    shadowPath.lineTo(0.0, size.height * 0.70);
    shadowPath.lineTo(size.width, size.height - 8);
    shadowPath.lineTo(size.width, size.height - 40);
    shadowPath.lineTo(0.0, size.height * 0.65);
    shadowPath.close();
    canvas.drawShadow(shadowPath, Colors.black45, 5.0, false);

    canvas.drawPath(path, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SignUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var bottomLeftA = Angle.fromDegrees(-180.0);
    var bottomLeftB = Angle.fromDegrees(-90.0);
    var bottomRightA = Angle.fromDegrees(-270.0);
    var bottomRightB = Angle.fromDegrees(-90.0);

    Paint complete = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    Path path = Path();
    path.moveTo(0.0, 20);
    path.lineTo(0.0, size.height - 30);
    path.arcTo(
      Rect.fromCircle(center: Offset(30, size.height - 30), radius: 30.0),
      bottomLeftA.radians,
      bottomLeftB.radians,
      false,
    );
    path.lineTo(size.width - 30, size.height);
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width - 30, size.height - 30), radius: 30.0),
      bottomRightA.radians,
      bottomRightB.radians,
      false,
    );
    path.lineTo(size.width, size.height * 0.26);
    path.quadraticBezierTo(size.width, (size.height * 0.26) - 10,
        size.width - 20, (size.height * 0.26) - 20);
    path.lineTo(20, 5);
    path.quadraticBezierTo(3.0, 3.0, 0.0, 18);
    path.close();

    Path topShadowPath = Path();
    topShadowPath.moveTo(25, -5.0);
    topShadowPath.lineTo(size.width, size.height * 0.225);
    topShadowPath.lineTo(size.width, (size.height * 0.20) + 40);
    topShadowPath.lineTo(0.0, (size.height * 0.20) + 40);
    topShadowPath.lineTo(0.0, 0.0);
    topShadowPath.close();
    canvas.drawShadow(topShadowPath, Colors.black45, 6.0, false);

    Path bottomShadowPath = Path();
    bottomShadowPath.moveTo(0.0, size.height - 50);
    bottomShadowPath.lineTo(0.0, size.height - 30);
    bottomShadowPath.arcTo(
      Rect.fromCircle(center: Offset(30, size.height - 30), radius: 30.0),
      bottomLeftA.radians,
      bottomLeftB.radians,
      false,
    );
    bottomShadowPath.lineTo(size.width - 30, size.height);
    bottomShadowPath.arcTo(
      Rect.fromCircle(
          center: Offset(size.width - 30, size.height - 30), radius: 30.0),
      bottomRightA.radians,
      bottomRightB.radians,
      false,
    );
    bottomShadowPath.lineTo(size.width, size.height * 0.26);

    canvas.drawShadow(bottomShadowPath, Colors.black45, 5.0, false);

    canvas.drawPath(path, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
