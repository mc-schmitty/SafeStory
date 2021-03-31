import 'package:QA/constants.dart';
import 'package:flutter/material.dart';

class BarLabel extends StatelessWidget {
  final String label;

  BarLabel({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: kSize15White,
          ),
        ),
        height: 40,
      ),
    );
  }
}
