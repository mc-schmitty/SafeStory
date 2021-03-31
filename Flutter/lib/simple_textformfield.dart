import 'package:flutter/material.dart';
import 'constants.dart';

// textfield that matches theme of app
class SimpleTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final Function validator;
  final Function onChanged;
  final String hintText;
  final Icon prefixIcon;
  final suffixIcon;
  final Color color;
  final bool obscureText;
  final String initialValue;
  final keyboardType;
  final int maxLines;
  final textInputAction;
  final inputFormatters;
  final hintColor;

  SimpleTextFormField({
    this.hintColor = Colors.grey,
    this.inputFormatters,
    this.controller,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.color = kGrey,
    this.obscureText = false,
    this.suffixIcon,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: kSize15White,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixStyle: kSize15Blue,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: kSize12Red,
        contentPadding: const EdgeInsets.all(12.0),
        isDense: true,
        filled: true,
        fillColor: color,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
        ),
      ),
    );
  }
}
