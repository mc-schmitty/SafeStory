
import 'package:QA/colored_button.dart';
import 'package:QA/constants.dart';
import "package:flutter/material.dart";
import 'package:page_view_indicators/circle_page_indicator.dart';

import 'home_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}



class _WelcomeScreenState extends State<WelcomeScreen> {

  final List<TextModel> textItems = [
    TextModel(
      title: "Completely Confidential",
      image: "assets/shield.png",
      body: "We do not collect or ask for any personal data including but not limited to your name, age, location, gender, and sexual orientation. All stories are processed by our backend but never stored anywhere and will never be seen by anyone",
    ),
    TextModel(
      title: "Write your story",
      image: "assets/diary.png",
      body: "We have trained a model to detect the presence of features of sexual violence using thousands of publicly available stories containing and not containing sexual violence. The model will process your story and tell you how sure it is that it has detected aspects relating to sexual violence in it. Again, your story will never be seen by anyone or saved anywhere",
    ),
    TextModel(
      title: "Find Resources",
      image: "assets/help.png",
      body: "What you choose to do with the analysis or your story is completely up to you. Our mission is only to increase awareness for victims. That being said, we do offer a list of resources such as emails and phone numbers to provide you support",
    ),
  ];

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  _buildBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _buildPageView(),
              _buildCircleIndicator(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ColoredButton(
              title: "Ok, Got it.",
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              textColor: kLightGreen2,
              buttonColor: kGreen,
            ),
          ),
        ],
      ),
    );
  }

  _buildPageView() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.8,
      child: PageView.builder(
          itemCount: 3,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textItems[index].title,
                    style: kSize25DarkGreen2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image(
                      image: AssetImage(textItems[index].image),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 130,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            textItems[index].body,
                            style: kSize15DarkGreen1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: 3,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}

class TextModel {
  final String title;
  final String body;
  final String image;

  TextModel({this.title, this.body, this.image});
}