import 'package:flutter/material.dart';
import '../util/constants.dart';



class GenderContent extends StatelessWidget {
  final String genderText;
  final IconData genderIcon;

  GenderContent({this.genderText, this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(this.genderText, style: kLabelTextStyle),
      ],
    );
  }
}
