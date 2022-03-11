import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kernel/kernel.dart';

class RegularTextFormField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final Color? fillColor;

  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final List<ValidatorBase<dynamic>> validatorList;
  final AutovalidateMode autoValidateMode;
  final TextInputType? textInputType;
  final Function()? onSuffixPressed;
  final Function(String)? onChanged;
  final int? maxLines, maxLength;
  final bool enabled, obsecuring, autoFocus;
  final VoidCallback? onEnterPressed;
  final EdgeInsets? iconPadding;

  const RegularTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.floatingLabelBehavior,
    this.prefixIconData,
    this.suffixIconData,
    this.iconPadding,
    this.enabled = true,
    this.autoFocus = false,
    this.obsecuring = false,
    this.inputFormatters = const [],
    this.validatorList = const [],
    this.textInputType,
    this.autoValidateMode = AutovalidateMode.always,
    required this.controller,
    this.onSuffixPressed,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onEnterPressed,
    this.fillColor,
  }) : super(key: key);

  @override
  _RegularTextFormFieldState createState() => _RegularTextFormFieldState();
}

class _RegularTextFormFieldState extends State<RegularTextFormField> {
  late String warningMessage = "";
  bool doesContainWarning = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.validatorList.any((element) => element.validationLevel == ValidationLevel.WARNING)) {
      widget.controller.addListener(() {
        warningMessage = widget.validatorList.getWarningMessage(widget.controller.text) ?? "";
        doesContainWarning = warningMessage != "";
        setState(() {});
      });
    }
    warningMessage = widget.validatorList.getWarningMessage(widget.controller.text) ?? "";
    doesContainWarning = warningMessage != "";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      cursorColor: KColors.primaryColor,
      decoration: InputDecoration(
        enabled: widget.enabled,
        fillColor: widget.fillColor,
        contentPadding: const EdgeInsets.all(14),
        filled: true,
        hintText: widget.hintText ?? '',
        labelText: widget.labelText ?? '',
        hintStyle: JojoTextStyle.textFieldHint(context: context),
        alignLabelWithHint: true,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        labelStyle: JojoTextStyle.textFieldLabel(context: context),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: KColors.hoverColor),
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Padding(
          padding: widget.iconPadding ?? EdgeInsets.zero,
          child: Icon(
            widget.prefixIconData,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        suffixIcon: widget.suffixIconData != null
            ? Padding(
                padding: widget.iconPadding ?? EdgeInsets.zero,
                child: InkWell(
                  onTap: widget.onSuffixPressed ?? () {},
                  child: Icon(
                    widget.suffixIconData,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              )
            : null,
      ),
      maxLines: widget.maxLines,
      enableInteractiveSelection: true,
      maxLength: widget.maxLength,
      obscureText: widget.obsecuring,
      obscuringCharacter: "*",
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autoValidateMode,
      validator: (value) => widget.validatorList.getErrorMessage(value ?? ""),
    );
  }
}
