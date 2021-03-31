import 'package:QA/constants.dart';
import 'package:flutter/material.dart';

import 'back_button.dart';

class ResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: Column(
          children: [
            Center(
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
                        "Resources",
                        style: kSize25White,
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      child: Text("US based", style: kSize20White),
                      alignment: Alignment.centerLeft,
                    ),
                    ResourceCard(
                      name: "National Sexual Assault Hotline",
                      phoneNumber: "800-656-HOPE (4673)",
                    ),
                    ResourceCard(
                      name: "National Domestic Violence Hotline",
                      phoneNumber: "800-799-SAFE (7233)",
                    ),
                    ResourceCard(
                      name: "Loveisrespect",
                      phoneNumber: "866-331-9474",
                    ),
                    SizedBox(height: 40),
                    Align(
                      child: Text("Canada based", style: kSize20White),
                      alignment: Alignment.centerLeft,
                    ),
                    ResourceCard(
                      name: "Assaulted Women's Helpline",
                      phoneNumber: "1-866-863-0511",
                    ),
                    ResourceCard(
                      name: "Kids Help Phone",
                      phoneNumber: "1-800-668-6868",
                    ),
                    ResourceCard(
                      name: "Male Survivors of Sexual Violence",
                      phoneNumber: "1-866-887-0015",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final bool isEmail;

  ResourceCard({this.name, this.phoneNumber, this.emailAddress, this.isEmail = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: kSize20White,
            ),
            Text(
              isEmail
                  ? "Email: $emailAddress"
                  : "Phone: $phoneNumber",
              style: kSize15White,
            ),
          ],
        ),
      ),
    );
  }
}
