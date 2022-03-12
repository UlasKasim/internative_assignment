import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:mobile/component/_component_exporter.dart';
import 'package:mobile/constants/_constants_exporter.dart';
import 'package:mobile/pages/sign/_sign_page_exporter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpVC vc = Get.put(SignUpVC());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            SignConstants.LOGIN,
            style: KTextStyle.h1(
              textStyleBase: const TextStyleBase(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: content(),
      ),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          _buildImage(),
          const SizedBox(
            height: 100,
          ),
          _buildForm(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Hero(
      tag: SignConstants.LOGO_HERO_TAG,
      child: Image.asset(
        SignConstants.LOGO_PATH,
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Suw.w(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegularTextFormField(
            labelText: SignConstants.EMAIL,
            prefixIconData: Icons.email_rounded,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            controller: TextEditingController(text: vc.userX.value.email),
            onChanged: vc.userX.value.onEmailChanged,
            validatorList: vc.userX.value.emailValidators(),
          ),
          const SizedBox(height: 10),
          PasswordTextField(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: SignConstants.PASSWORD,
            controller: TextEditingController(text: vc.userX.value.password),
            onChanged: vc.userX.value.onPasswordChanged,
            validatorList: vc.userX.value.passwordValidators(),
          ),
          const SizedBox(height: 10),
          PasswordTextField(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: SignConstants.RE_PASSWORD,
            controller: TextEditingController(text: vc.rePasswordX.value),
            onChanged: vc.onRePasswordChanged,
          ),
          const SizedBox(height: 40),
          GeneralButtonComponent(
            isPrimaryBackground: true,
            text: SignConstants.REGISTER,
            onPressed: () => vc.onSignUpPressed(route: AppRoutes.BOTTOM_NAVIGATION),
          ),
          const SizedBox(height: 10),
          GeneralButtonComponent(
            isPrimaryBackground: false,
            text: SignConstants.LOGIN,
            onPressed: () => vc.onPushPressed(route: AppRoutes.SIGN_IN),
          ),
        ],
      ),
    );
  }
}
