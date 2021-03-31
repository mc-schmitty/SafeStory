import 'package:QA/colored_button.dart';
import 'package:QA/meditation_screen.dart';
import 'package:QA/resources_screen.dart';
import 'package:QA/story_screen.dart';
import 'package:QA/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 100, right: 50.0, left: 50, bottom: 50),
                child: Image(
                  image: AssetImage("assets/safestory3.png"),
                ),
              ),
              color: Colors.white,
            ),
          ),
          Container(
            color: kGreen,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ColoredButton(
                    title: "How it Works",
                    buttonColor: kDarkGreen1,
                    textColor: kLightGreen1,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      );
                    },
                  ),
                  ColoredButton(
                    title: "Analyze a Story",
                    buttonColor: kDarkGreen1,
                    textColor: kLightGreen1,
                    onPressed: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                        builder: (context) => CustomBottomSheet(
                          onPressed2: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StoryScreen()),
                            );
                          },
                          onPressed1: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MeditationScreen()),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  ColoredButton(
                    title: "Resources",
                    buttonColor: kDarkGreen1,
                    textColor: kLightGreen1,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResourcesScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}