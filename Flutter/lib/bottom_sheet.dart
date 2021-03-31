import 'package:QA/colored_button.dart';
import 'package:QA/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'simple_textformfield.dart';
import 'package:frino_icons/frino_icons.dart';

// rounded bottom sheet with textfield
class CustomBottomSheet extends StatelessWidget {

  final Function onPressed1;
  final Function onPressed2;

  CustomBottomSheet({this.onPressed1, this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Retracing the events of a traumatic experience can be frightening. Would you like to meditate for 60 seconds before doing so?",
                style: kSize15Black,
              ),
              SizedBox(height: 20),
              ColoredButton(
                onPressed: onPressed1,
                title: "Yes",
                buttonColor: kGreen,
                textColor: Colors.white,
              ),
              ColoredButton(
                onPressed: onPressed2,
                title: "No, I would like to skip this"
              ),
            ],
          ),
        ),
      ),
    );
  }
}
