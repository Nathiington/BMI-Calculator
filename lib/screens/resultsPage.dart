import 'package:bmi_calculator/components/Cards.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';

import '../components/Buttons.dart';
import 'inputPage.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String restults;
  final String interpretation;

  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.restults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kResultsTitle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MainCard(
              color: kActiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                   restults,
                    style: kResultsTextHeader,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItext,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      interpretation,
                      style: kBMIbody,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: CalculateButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
            btnTitle: 'Re-Calculate',
          )),
        ],
      ),
    );
  }
}
