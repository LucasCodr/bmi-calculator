import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function onPressed;

  CardIcon({ this.icon, this.text, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            this.icon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            this.text,
            style: kLabelStyle,
          )
        ],
      ),
    );
  }
}