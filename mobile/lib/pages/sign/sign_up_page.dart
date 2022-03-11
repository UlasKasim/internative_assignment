import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            SignConstants.login,
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
          _buildForm(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: Suw.h(550),
      width: Suw.w(880),
      child: Hero(
        tag: SignConstants.logoHeroTag,
        child: Image.asset(
          SignConstants.logoPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      // height: 300,
      padding: EdgeInsets.symmetric(horizontal: Suw.w(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RegularTextFormField(
            labelText: SignConstants.email,
            prefixIconData: Icons.email_rounded,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            controller: TextEditingController(text: vc.userX.value.email),
            onChanged: vc.userX.value.onEmailChanged,
            validatorList: vc.userX.value.emailValidators(),
          ),
          const SizedBox(height: 10),
          PasswordTextField(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: SignConstants.password,
            controller: TextEditingController(text: vc.userX.value.password),
            onChanged: vc.userX.value.onPasswordChanged,
            validatorList: vc.userX.value.passwordValidators(),
          ),
          const SizedBox(height: 10),
          PasswordTextField(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: SignConstants.rePassword,
            controller: TextEditingController(text: vc.rePasswordX.value),
            onChanged: vc.onRePasswordChanged,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: RectangleTextButton(
                  text: SignConstants.register,
                  backColor: KColors.primaryColor,
                  textStyle: KTextStyle.h3(
                    textStyleBase: const TextStyleBase(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Icons.login_sharp,
                  iconSize: 20,
                  textColor: Colors.white,
                  onPressed: () => vc.onSignUpPressed(route: AppRoutes.HOME),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: RectangleTextButton(
                  text: SignConstants.login,
                  backColor: Colors.white,
                  textStyle: KTextStyle.h3(
                    textStyleBase: const TextStyleBase(),
                  ),
                  icon: Icons.login_sharp,
                  iconSize: 20,
                  textColor: KColors.primaryColor,
                  onPressed: () => vc.onPushPressed(route: AppRoutes.SIGN_IN),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
