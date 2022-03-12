import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
import 'package:mobile/component/_component_exporter.dart';
import 'package:mobile/constants/_constants_exporter.dart';
import 'package:mobile/pages/sign/_sign_page_exporter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInVC vc = Get.put(SignInVC());

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
      padding: EdgeInsets.symmetric(horizontal: Suw.w(context, 50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegularTextFormField(
            labelText: SignConstants.EMAIL,
            prefixIconData: Icons.email_rounded,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            controller: TextEditingController(text: vc.userX.value.email),
            onChanged: vc.userX.value.onEmailChanged,
            validatorList: vc.userX.value.emailValidators(),
          ),
          const SizedBox(height: 10),
          PasswordTextField(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: SignConstants.PASSWORD,
            controller: TextEditingController(text: vc.userX.value.password),
            onChanged: vc.userX.value.onPasswordChanged,
            validatorList: vc.userX.value.passwordValidators(),
          ),
          const SizedBox(height: 40),
          GeneralButtonComponent(
            isPrimaryBackground: true,
            text: SignConstants.LOGIN,
            onPressed: () => vc.onSignInPressed(route: AppRoutes.BOTTOM_NAVIGATION),
          ),
          const SizedBox(height: 10),
          GeneralButtonComponent(
            isPrimaryBackground: false,
            text: SignConstants.REGISTER,
            onPressed: () => vc.onPushPressed(route: AppRoutes.SIGN_UP),
          ),
        ],
      ),
    );
  }
}
