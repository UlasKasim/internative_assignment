import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:mobile/login/_login_page_exporter.dart';

import '../constants/_constants_exporter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ServerController serverController = Get.put(ServerController());
  LoginVC vc = Get.put(LoginVC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LoginConstants.login,
          style: KTextStyle.h1(
            textStyleBase: const TextStyleBase(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        _buildImage(),
        _buildForm(),
      ],
    );
  }

  Widget _buildImage() {
    return Hero(
      tag: 'logo',
      child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: Suw.h(405),
            width: Suw.w(880),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      height: 300,
      width: 500,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: RegularTextFormField(
              labelText: 'E-MAİL',
              prefixIconData: Icons.people,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              controller: TextEditingController(text: vc.userX.value.email),
              onChanged: vc.userX.value.onEmailChanged,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: PasswordTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'PASSWORD',
              controller: TextEditingController(text: vc.userX.value.password),
              onChanged: vc.userX.value.onPasswordChanged,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  child: Text(LoginConstants.login),
                  style: TextButton.styleFrom(
                    backgroundColor: KColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => vc.onLoginPressed(route: AppRoutes.HOME),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
