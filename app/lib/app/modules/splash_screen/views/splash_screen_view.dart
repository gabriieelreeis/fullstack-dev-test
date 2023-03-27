import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: Image.asset(
              'assets/logo.png',
              width: (ScreenUtil().screenWidth * .7),
            ),
          ),
        ),
      ),
    );
  }
}
