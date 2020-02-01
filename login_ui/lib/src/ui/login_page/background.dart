import 'package:flutter/material.dart';
import 'package:login_ui/src/utils/custom_clippers.dart';

Widget scaffoldBackground(double screenHeight, double screenWidth) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: IntrinsicHeight(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  child: ClipPath(
                    clipper: PinkClipper(),
                    child: Container(
                      height: screenHeight / 2,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFf0871f), Color(0xFFc20ebf)],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -screenHeight / 6,
                  left: -screenWidth / 2,
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth / 2),
                      color: Colors.red.withOpacity(0.27),
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.05,
                  right: -screenWidth / 1.4,
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth / 2),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFf0871f), Color(0xFFc20ebf)],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
