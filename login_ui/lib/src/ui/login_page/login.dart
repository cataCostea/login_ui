import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/src/providers/login_provider.dart';
import 'background.dart';
import 'sign_in_widget.dart';
import 'sign_up_widget.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loginProvider;
  var screenHeight;
  var screenWidth;
  ScrollController _controller = ScrollController();

  scrollListener() {
    if (_controller.offset <= screenHeight / 2 &&
        !_controller.position.outOfRange) {
      loginProvider.setArrowsAngle(0.0);
      loginProvider.setSocialLoginAlignment(Alignment.topLeft);
    }
    if (_controller.offset > screenHeight / 2 &&
        !_controller.position.outOfRange) {
      loginProvider.setArrowsAngle(355.0);
      loginProvider.setSocialLoginAlignment(Alignment.bottomRight);
    }
  }

  @override
  void initState() {
    _controller.addListener(scrollListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    loginProvider = Provider.of<LoginProvider>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          scaffoldBackground(screenHeight, screenWidth),
          ListView(
            controller: _controller,
            children: <Widget>[
              SignInWidget(),
              SignUpWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
