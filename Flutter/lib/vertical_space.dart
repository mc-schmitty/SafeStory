import 'package:flutter/material.dart';

// alias for sized box with no width and swttable height
class VerticalSpace extends StatelessWidget {
  final double height;

  VerticalSpace(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}