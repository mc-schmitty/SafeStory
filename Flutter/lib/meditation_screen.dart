import 'package:QA/back_button.dart';
import 'package:QA/story_screen.dart';
import 'package:flutter/material.dart';
import 'colored_button.dart';
import 'constants.dart';
import 'package:quiver/async.dart';

class MeditationScreen extends StatefulWidget {

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  int _start = 60;
  int _current = 60;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
    });

    sub.onDone(() {
      print("Done");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoryScreen()),
      );
      sub.cancel();
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
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
                    "Take deep breaths and relax",
                    style: kSize25White,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Go to the next page whenever you feel ready",
                    style: kSize15White,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Center(child: Text("$_current", style: kSize50White)),
                ),
                ColoredButton(
                  title: "I'm ready to write my story",
                  buttonColor: kDarkGreen1,
                  textColor: kLightGreen2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
