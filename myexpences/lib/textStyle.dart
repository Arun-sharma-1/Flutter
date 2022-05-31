import 'package:flutter/material.dart';

class TextStyles extends StatelessWidget {
  var textString;
  TextStyles(this.textString);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(textString,
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 16,
              letterSpacing: 0.8,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}
