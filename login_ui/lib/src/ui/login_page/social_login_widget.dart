import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/src/providers/login_provider.dart';
import 'package:login_ui/src/utils/login_icons.dart';
import 'dart:ui' as ui;

class SocialLoginsWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  SocialLoginsWidget(this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      height: screenHeight * 0.82,
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: screenHeight / 3.2,
        duration: Duration(milliseconds: 1500),
        alignment: loginProvider.socialLoginAlignment,
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(180.0)),
                  color: loginProvider.socialLoginAlignment == Alignment.topLeft
                      ? Colors.red
                      : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Login.google,
                    color:
                        loginProvider.socialLoginAlignment == Alignment.topLeft
                            ? Colors.white
                            : Colors.red,
                  ),
                  onPressed: () {
                    print("GOOGLE");
                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                margin: EdgeInsets.only(
                    right: 10.0, top: screenHeight < 700 ? 40 : 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(180.0)),
                  color: loginProvider.socialLoginAlignment == Alignment.topLeft
                      ? Colors.blueAccent
                      : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Login.facebook,
                    color:
                        loginProvider.socialLoginAlignment == Alignment.topLeft
                            ? Colors.white
                            : Colors.blueAccent,
                  ),
                  onPressed: () {
                    print("FACEBOOK");
                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                margin: EdgeInsets.only(
                    right: 10.0, top: screenHeight < 700 ? 80 : 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(180.0)),
                  color: loginProvider.socialLoginAlignment == Alignment.topLeft
                      ? Colors.lightBlueAccent
                      : Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Login.twitter,
                    color:
                        loginProvider.socialLoginAlignment == Alignment.topLeft
                            ? Colors.white
                            : Colors.lightBlueAccent,
                  ),
                  onPressed: () {
                    print("TWITTER");
                  },
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                margin: EdgeInsets.only(top: screenHeight < 700 ? 120 : 150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(180.0)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors:
                        loginProvider.socialLoginAlignment == Alignment.topLeft
                            ? [
                                Color(0xFFf0871f),
                                Color(0xFFc20ebf),
                              ]
                            : [Colors.white, Colors.white],
                  ),
                ),
                child: IconButton(
                  icon: loginProvider.socialLoginAlignment == Alignment.topLeft
                      ? Icon(
                          Login.instagram_1,
                          color: Colors.white,
                        )
                      : ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              Offset(4.0, 24.0),
                              Offset(24.0, 4.0),
                              [
                                Color(0xFFf0871f),
                                Color(0xFFc20ebf),
                              ],
                            );
                          },
                          child: Icon(Login.instagram_1),
                        ),
//                  icon: ShaderMask(
//                    shaderCallback: (Rect bounds) {
//                      return RadialGradient(
//                        center: Alignment.topLeft,
//                        radius: 1.0,
//                        colors: <Color>[
//                          Colors.greenAccent[200],
//                          Colors.blueAccent[200]
//                        ],
//                        tileMode: TileMode.mirror,
//                      ).createShader(bounds);
//                    },
//                    child: Icon(
//                      Login.instagram_1,
//                      //color: Colors.white,
//                    ),
//                  ),
                  onPressed: () {
                    print("INSTAGRAM");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:login_ui/src/utils/login_icons.dart';
//
//class SocialLoginsWidget extends StatefulWidget {
//  final double screenWidth;
//  SocialLoginsWidget({Key key, this.screenWidth}) : super(key: key);
//  _SocialLoginState createState() => _SocialLoginState();
//}
//
//class _SocialLoginState extends State<SocialLoginsWidget>
//    with TickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<double> animation;
//  Animation<double> animationx;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller =
//    AnimationController(duration: Duration(milliseconds: 1500), vsync: this)
//      ..addListener(() => setState(() {}));
//    animation =
//        Tween(begin: 0.0, end: widget.screenWidth / 3).animate(_controller);
//    animationx = Tween(begin: 0.0, end: 45.0).animate(_controller);
//    // Future.delayed(Duration(seconds: 2), () {
//    //   _controller.forward();
//    // });
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//        animation: _controller,
//        builder: (context, child) {
//          return Transform.translate(
//            offset: Offset(animation.value, animationx.value),
//            child: Container(
//              //transform: Matrix4.translationValues(0, 100, 0),
//              padding: EdgeInsets.only(left: 15.0, right: 15.0),
//              child: Row(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  IconButton(
////                    child: Container(
////                      padding: EdgeInsets.all(10.0),
////                      margin: EdgeInsets.only(right: 10.0),
////                      decoration: BoxDecoration(
////                        borderRadius: BorderRadius.all(Radius.circular(180.0)),
////                        color: Colors.red,
////                      ),
////                      child: Icon(
////                        Login.google,
////                        color: Colors.white,
////                      ),
////                    ),
//                    icon: Icon(
//                      Login.google,
//                      color: Colors.red,
//                    ),
//                    onPressed: () {
//                      print("TAP");
//                      _controller.forward();
////                      _controller.forward().then((val) {
////                        _controller.reverse();
////                      });
//                    },
//                  ),
//                  GestureDetector(
//                    child: Container(
//                      transform: Matrix4.translationValues(0, 20, 0),
//                      padding: EdgeInsets.all(10.0),
//                      margin: EdgeInsets.only(right: 10.0),
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(Radius.circular(180.0)),
//                        color: Colors.blueAccent,
//                      ),
//                      child: Icon(
//                        Login.facebook,
//                        color: Colors.white,
//                      ),
//                    ),
//                    onTap: () => _controller.reverse(),
//                  ),
//                  Container(
//                    transform: Matrix4.translationValues(0, 40, 0),
//                    padding: EdgeInsets.all(10.0),
//                    margin: EdgeInsets.only(right: 10.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(180.0)),
//                      color: Colors.lightBlueAccent,
//                    ),
//                    child: Icon(
//                      Login.twitter,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Container(
//                    transform: Matrix4.translationValues(0, 60, 0),
//                    padding: EdgeInsets.all(10.0),
//                    margin: EdgeInsets.only(right: 10.0),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(180.0)),
//                      gradient: LinearGradient(
//                        begin: Alignment.centerLeft,
//                        end: Alignment.centerRight,
//                        colors: [
//                          Color(0xFFf0871f),
//                          Color(0xFFc20ebf),
//                        ],
//                      ),
//                    ),
//                    child: Icon(
//                      Login.instagram_1,
//                      color: Colors.white,
//                    ),
//                  )
//                ],
//              ),
//            ),
//          );
//        });
//  }
//}
