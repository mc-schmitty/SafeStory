import 'package:flutter/material.dart';
import 'constants.dart';
import 'horizontal_space.dart';
import 'nothing.dart';

// rounded button
class ColoredButton extends StatelessWidget {
  ColoredButton({this.title, this.buttonColor = kGrey, this.textColor = Colors.black, @required this.onPressed, this.borderRadius = 15, this.padding = 5, this.icon, this.hasBorder = false, this.height = 45});

  final String title;
  final double borderRadius;
  final Function onPressed;
  final Color buttonColor;
  final Color textColor;
  final double padding;
  final bool hasBorder;
  final double height;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: buttonColor,
            border: hasBorder ? Border.all(color: textColor, width: 2) : Border.all(color: Colors.transparent)
          ),
          child: SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // show trailing icon if supplied
                icon == null ?
                Nothing()
                    :
                Row(
                  children: [
                    HorizontalSpace(10),
                    Icon(
                      icon,
                      color: textColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
