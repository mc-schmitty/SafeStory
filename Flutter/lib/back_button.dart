import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'constants.dart';

class CustomBackButton extends StatelessWidget {

  final Function onPressed;

  CustomBackButton({this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Icon(Icons.arrow_back_ios_rounded, color: kDarkGreen2, size: 25),
          onTap: onPressed,
        ),
      ),
    );
  }
}