import 'package:bmi_calculator/components/bottom-button.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC - Resultado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: CardComponent(
              color: kPrimaryCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(this.resultText, style: kResultTextStyle,),
                  Text(this.bmiResult, style: kIMCTextStyle,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(this.interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonLabel: 'RE-CALCULAR',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }

}