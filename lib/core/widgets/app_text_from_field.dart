import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const AppTextFormField({
    Key? key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    required this.controller,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        isDense: true, //// عشان اعرف اديله بادينج
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.3),
                borderRadius: BorderRadius.circular(16.0)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.3),
                borderRadius: BorderRadius.circular(16.0)),
        hintStyle: hintStyle ??
            TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Color(0xff7E7E7E99)),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
      controller: controller,
      validator: validator,
    );
  }
}
