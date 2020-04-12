import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  CardComponent({ @required this.color, this.cardChild });
}