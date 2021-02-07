import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_permission_using_bloc/router/router_path.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double opacity = 0.0;
  AnimationController _iconAnimationController;

  CurvedAnimation _iconAnimation;

  void handleTimeout() {
    setState(() {
      opacity = 1.0;
      var duration = const Duration(seconds: 3);
      Timer(duration, navigateNext);
    });
  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, handleTimeout);
  }

  navigateNext() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, navigateToNextScreen);
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RouterPath.PERMISSION_SCREEN, (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Flutter Demo using",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AnimatedOpacity(
              opacity: 0.8,
              duration: Duration(seconds: 4),
              child: Image.network(
                "https://avatars.githubusercontent.com/u/37274346?s=280&v=4",
                width: _iconAnimation.value * 200,
                height: _iconAnimation.value * 200,
              ),
            ),
            Image.network(
              "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png",
              width: _iconAnimation.value * 200,
              height: _iconAnimation.value * 200,
            ),
          ],
        ),
      ),
    );
  }
}
