import 'package:QA/bar_label.dart';
import 'package:QA/bargraph.dart';
import 'package:QA/home_page.dart';
import 'package:QA/resources_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'colored_button.dart';
import 'explanation_screen.dart';

class ResultsScreen extends StatelessWidget {
  final data;

  ResultsScreen({@required this.data});

  @override
  Widget build(BuildContext context) {

    print(data);

    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Results',
                    style: kSize30White,
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "How is this calculated?",
                          style: kSize12White,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExplanationScreen()),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BarLabel(label: "Explicit Lack of Consent"),
                        BarLabel(label: "Abuse of Authority"),
                        BarLabel(label: "Force"),
                        BarLabel(label: "Unconscious"),
                        BarLabel(label: "Minor Injury"),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bar(width: 120),
                      Bar(width: 70, title: "Force"),
                      Bar(width: 20, title: "Minor"),
                      Bar(width: 10, title: "Threat"),
                      Bar(width: 10, title: "Minor Injury"),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  ColoredButton(
                    title: "Edit my story",
                    textColor: kLightGreen1,
                    buttonColor: kDarkGreen1,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ColoredButton(
                    title: "Home page",
                    textColor: kLightGreen1,
                    buttonColor: kDarkGreen1,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ),
                  ColoredButton(
                    title: "Resources",
                    textColor: kLightGreen1,
                    buttonColor: kDarkGreen1,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResourcesScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  String getMessage(int percent) {
    String message;
    if (percent <= 50) {
      message = "It is unlikely that there was been sexual violence involved in your story";
    } else if (percent > 50 && percent <= 75) {
      message = "It is somewhat likely that there was been sexual violence involved in your story";
    } else if (percent > 75 && percent <= 90){
      message = "It is likely that there was sexual violence involved in your story";
    } else {
      message = "It is extremely likely that there was sexual violence involved in your story";
    }
    return message;
  }
}
