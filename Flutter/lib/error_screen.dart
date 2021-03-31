import 'package:flutter/material.dart';
import 'constants.dart';
import 'colored_button.dart';

class ErrorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "There was an error processing your story.",
                      style: kSize20White,
                    ),
                    SizedBox(height: 10),
                    ColoredButton(
                      title: "Return to previous screen",
                      textColor: kLightGreen1,
                      buttonColor: kDarkGreen1,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
