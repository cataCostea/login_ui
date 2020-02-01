import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/src/providers/login_provider.dart';
import 'package:login_ui/src/utils/custom_painters.dart';
import 'social_login_widget.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({Key key}) : super(key: key);

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInWidget> {
  var loginProvider;
  var screenHeight;
  var screenWidth;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;

  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    print('sign in');
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    loginProvider = Provider.of<LoginProvider>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print(screenHeight);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: screenHeight * 0.75,
            width: screenWidth,
            child: CustomPaint(
              size: Size(screenWidth - 40, screenHeight * 0.75),
              painter: SignInPainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
            width: screenWidth,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "LOGO",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                _buildLoginForm(),
                _loginButton(),
                _switchButton(),
              ],
            ),
          ),
          SocialLoginsWidget(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: this._loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: "Email",
                suffixIcon: Icon(Icons.mail),
              ),
              onFieldSubmitted: (val) {
                Focus.of(context).requestFocus(passwordFocusNode);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              obscureText: loginProvider.obscurePassText,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  hintText: "Password",
                  suffixIcon: Icon(Icons.vpn_key)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              onTap: () => print("Forgot Password!"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Container(
          padding:
              EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0, right: 50.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFf0871f),
                Color(0xFFc20ebf),
              ],
            ),
          ),
          child: Text(
            "Login".toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.5),
          ),
        ),
        onTap: () =>
            loginProvider.setSocialLoginAlignment(Alignment.bottomRight),
      ),
    );
  }

  Widget _switchButton() {
    return Container(
      alignment: Alignment.bottomRight,
      transform: Matrix4.translationValues(15.0, 0, 0),
      height: (screenHeight * 0.75) / 4.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(180.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFf0871f),
              Color(0xFFc20ebf),
            ],
          ),
        ),
        child: Transform.rotate(
          angle: loginProvider.arrowsAngle,
          origin: Offset.zero,
          child: Icon(
            Icons.arrow_downward,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
