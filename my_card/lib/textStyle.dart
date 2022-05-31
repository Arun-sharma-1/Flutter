import 'package:flutter/material.dart';

class TextStyles extends StatelessWidget {
  var textString;
  TextStyles(this.textString);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(textString,
          style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black)),
    );
  }
}
