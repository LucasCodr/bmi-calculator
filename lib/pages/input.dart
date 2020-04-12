import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/components/bottom-button.dart';
import 'package:bmi_calculator/components/card-icon.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/rounded-icon-button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums/gender.dart';
import 'package:bmi_calculator/pages/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardComponent(
                    color: selectedGender == Gender.male ? kPrimaryCardColor : kSecondaryCardColor,
                    cardChild: CardIcon(
                      icon: FontAwesomeIcons.mars,
                      text: 'MASCULINO',
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  )
                ),
                Expanded(
                  child: CardComponent(
                    color: selectedGender == Gender.female ? kPrimaryCardColor : kSecondaryCardColor,
                    cardChild: CardIcon(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMININO',
                      onPressed: ()  {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: CardComponent(
              color: kPrimaryCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.00,
                      max: 220.00,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardComponent(
                    color: kPrimaryCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Peso', style: kLabelStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() => weight++);
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() => weight--);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardComponent(
                    color: kPrimaryCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('IDADE', style: kLabelStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() => age++);
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() => age--);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            buttonLabel: 'CALCULAR',
            onPressed: () {

              BMI bmi = BMI(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: bmi.calculateBMI(),
                      interpretation: bmi.getInterpretation(),
                      resultText: bmi.getResult(),
                    )
                )
              );
            },
          )
        ],
      )
    );
  }
}