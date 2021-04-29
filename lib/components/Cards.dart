import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;
  final Function onDoublePress;


  MainCard({
    @required this.color,
    this.cardChild,
    this.onPress,
    this.onDoublePress
  });

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      onDoubleTap:onDoublePress ,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: this.color),
      ),
    );
  }
}
