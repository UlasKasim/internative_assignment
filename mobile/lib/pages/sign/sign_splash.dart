import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants/_constants_exporter.dart';
import 'package:mobile/pages/sign/_sign_page_exporter.dart';

class SignSplash extends StatefulWidget {
  const SignSplash({Key? key}) : super(key: key);

  @override
  _SignSplashState createState() => _SignSplashState();
}

class _SignSplashState extends State<SignSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => NavigationUtil.getPushNamed(AppRoutes.SIGN_IN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: SignConstants.logoHeroTag,
          child: Image.asset(
            SignConstants.logoPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
