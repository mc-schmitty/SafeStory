import 'package:QA/constants.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double width;
  final String title;
  Bar({this.width, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF355b86),
                ),
                width: width,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${(width / 150).toStringAsFixed(2)}",
                    style: kSize15White,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
