import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {

  final String buttonLabel;
  final Function onPressed;

  BottomButton({@required this.buttonLabel, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(child: Text(this.buttonLabel, style: kLargeButtonStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}