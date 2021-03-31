import 'package:QA/back_button.dart';
import 'package:QA/constants.dart';
import 'package:flutter/material.dart';

class ExplanationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              CustomBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "How the score is calculated",
                style: kSize25White,
              ),
              SizedBox(height: 20),
              Text(
                "Explanation here",
                style: kSize20White,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
