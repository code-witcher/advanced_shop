import 'dart:async';

import 'package:advanced_shop/presentation/resources/assets_manager.dart';
import 'package:advanced_shop/presentation/resources/color_manager.dart';
import 'package:advanced_shop/presentation/resources/routes_manager.dart';
import 'package:advanced_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(
      const Duration(seconds: AppConstants.splashDuration),
      () {
        Navigator.of(context).pushReplacementNamed(Routes.onboardingRoute);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
