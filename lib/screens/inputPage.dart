import 'package:bmi_calculator/util/functionality.dart';
import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Buttons.dart';
import '../components/Cards.dart';
import '../components/GenderContent.dart';
import '../util/constants.dart';
import 'package:bmi_calculator/util/functionality.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected;
  int height = 180;
  int weight = 65;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
// ************************* Gender Selection Cards
            child: Row(
              children: [
                Expanded(
                  child: MainCard(
                    onPress: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                    onDoublePress: () {
                      setState(() {
                        selected = null;
                      });
                    },
                    color:
                        selected == Gender.male ? kSelectedCard : kInactiveCard,
                    cardChild: GenderContent(
                        genderText: 'Male', genderIcon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: MainCard(
                    onPress: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                    onDoublePress: () {
                      setState(() {
                        selected = null;
                      });
                    },
                    color:
                        selected == Gender.female ? kSelectedCard : kInactiveCard,
                    cardChild: GenderContent(
                        genderText: 'Female',
                        genderIcon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),

//  ***************** Slider
          Expanded(
            child: MainCard(
              color: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      activeColor: Color(0xffeb1555),
                      inactiveColor: Color(0xff8d8e98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),

// *********** Next Row

          Expanded(
            child: Row(
              children: [
                // Weight
                Expanded(
                  child: MainCard(
                    color: kActiveCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // AGE
                Expanded(
                  child: MainCard(
                    color: kActiveCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calculate Button
          CalculateButton(
            onTap: () {
              Functinality myFunctionality =
                  Functinality(height: height, weight: weight);
              

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: myFunctionality.calculate(),
                  restults: myFunctionality.getResults(),
                  interpretation: myFunctionality.getInterpretation(),
                )),
              );
            },
            btnTitle: 'Calculate',
          ),
        ],
      ),
    );
  }
}
