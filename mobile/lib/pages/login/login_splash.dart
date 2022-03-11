import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants/_constants_exporter.dart';
import 'package:mobile/pages/login/_login_page_exporter.dart';

class LoginSplash extends StatefulWidget {
  const LoginSplash({Key? key}) : super(key: key);

  @override
  _LoginSplashState createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
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
          tag: LoginConstants.logoHeroTag,
          child: Image.asset(
            LoginConstants.logoPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
