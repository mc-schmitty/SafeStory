import 'package:QA/back_button.dart';
import 'package:QA/error_screen.dart';
import 'package:QA/results_screen.dart';
import 'package:QA/simple_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'colored_button.dart';
import 'dart:convert';
import 'constants.dart';
import 'package:http/http.dart' as http;

class StoryScreen extends StatefulWidget {

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {

    print(showSpinner);

    TextEditingController storyController = TextEditingController();
    return Scaffold(
      backgroundColor: kGreen,
      body: showSpinner == false
        ? SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  CustomBackButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Write out what happened",
                      style: kSize25White,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Everything you type below is 100% confidential",
                      style: kSize15White,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SimpleTextFormField(
                      hintText: "This is my story...",
                      hintColor: kLightGreen2,
                      maxLines: 100,
                      color: kDarkishGreen,
                      controller: storyController,
                    ),
                  ),
                  ColoredButton(
                    title: "Analyze my story",
                    buttonColor: kDarkGreen1,
                    textColor: kLightGreen1,
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                        print(showSpinner);
                      });

                      var story = storyController.text;
                      var url = Uri.parse('https://safe-story.ue.r.appspot.com/');
                      var body = json.encode({ "story": story });
                      var response = await http.post(
                        url,
                        body: body,
                        headers: {'Content-Type': 'application/json'});

                      var jsondata = json.decode(response.body);



                      if (jsondata['message'] == "Success!") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResultsScreen(data: jsondata)),
                        );
                        setState(() {
                          showSpinner = false;
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ErrorScreen()),
                        );
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Analyzing...", style: kSize15White),
              ],
            ),
          ),
    );
  }
}
