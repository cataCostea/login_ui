import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  double _screenWidth;
  double _screenHeight;
  bool _obscurePassText = true;
  bool _obscureSignUpPass = true;
  bool _obscureSignUpConfirmPass = true;
  Alignment _socialLoginAlignment = Alignment.topLeft;
  double _arrowsAngle = 0.0;

  LoginProvider();

  double get screenHeight => _screenHeight;
  double get screenWidth => _screenWidth;
  bool get obscurePassText => _obscurePassText;
  bool get obscureSignUpPassText => _obscureSignUpPass;
  bool get obscureSignUpConfirmPassText => _obscureSignUpConfirmPass;
  Alignment get socialLoginAlignment => _socialLoginAlignment;
  double get arrowsAngle => _arrowsAngle;

  setScreenDimensions(double height, double width) {
    _screenHeight = height;
    _screenWidth = width;
    notifyListeners();
  }

  setObscureText(bool value) {
    _obscurePassText = value;
  }

  setObscureSignUpPassText(bool value) {
    _obscureSignUpPass = value;
  }

  setObscureSignUpConfirmPassText(bool value) {
    _obscureSignUpConfirmPass = value;
  }

  setSocialLoginAlignment(Alignment alignment) {
    _socialLoginAlignment = alignment;
    notifyListeners();
  }

  setArrowsAngle(double angle) {
    _arrowsAngle = angle;
    notifyListeners();
  }
}
