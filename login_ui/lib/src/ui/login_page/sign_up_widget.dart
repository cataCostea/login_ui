import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/src/providers/login_provider.dart';
import 'package:login_ui/src/utils/custom_painters.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key key}) : super(key: key);

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpWidget> {
  var loginProvider;
  var screenHeight;
  var screenWidth;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  FocusNode confirmPasswordNode;

  GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordNode = FocusNode();
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
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      transform:
          Matrix4.translationValues(0, screenHeight <= 736.0 ? -80 : -100, 0),
      color: Colors.transparent,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: screenHeight * 0.75,
            width: screenWidth,
            child: CustomPaint(
              size: Size(screenWidth - 40, screenHeight * 0.75),
              painter: SignUpPainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            width: screenWidth,
            height: screenHeight * 0.75,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    _switchButton(),
                    Container(
                      height: (screenHeight * 0.75) / 4,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "LOGO",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ],
                ),
                _buildSignUpForm(),
                _signUpButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Form(
      key: this._signUpFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextFormField(
              controller: nameController,
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
                hintText: "Name",
                suffixIcon: Icon(Icons.person),
              ),
              onFieldSubmitted: (val) {
                Focus.of(context).requestFocus(emailFocusNode);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
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
            margin: EdgeInsets.only(top: 20.0),
            child: TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              obscureText: loginProvider.obscureSignUpPassText,
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
                hintText: "Password",
                suffixIcon: Icon(Icons.vpn_key),
              ),
              onFieldSubmitted: (val) {
                Focus.of(context).requestFocus(confirmPasswordNode);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: TextFormField(
              controller: confirmPasswordController,
              focusNode: confirmPasswordNode,
              keyboardType: TextInputType.visiblePassword,
              obscureText: loginProvider.obscureSignUpConfirmPassText,
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
                hintText: "Confirm Password",
                suffixIcon: Icon(Icons.vpn_key),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.bottomRight,
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
            "Signup".toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.5),
          ),
        ),
        onTap: () => print("SIGNUP"),
      ),
    );
  }

  Widget _switchButton() {
    return Container(
      alignment: Alignment.topLeft,
      transform: Matrix4.translationValues(-15.0, 15, 0),
      height: (screenHeight * 0.75) / 4,
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
