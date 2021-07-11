import 'package:flutter/material.dart';


class Reusablecard extends StatelessWidget {
  Reusablecard({this.onpress,this.colour,this.cardchild});
  final Color colour;
  final Widget cardchild;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardchild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
