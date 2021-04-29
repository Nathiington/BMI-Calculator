import 'package:flutter/material.dart';
import '../util/constants.dart';


class CalculateButton extends StatelessWidget {
  final Function onTap;
  final String btnTitle;

  CalculateButton({this.onTap, this.btnTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            btnTitle,
            style: kTitleStyle,
          ),
        ),
        color: Color(0xffeb1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      elevation: 6.0,
      onPressed: onPress,
    );
  }
}
