import 'package:flutter/material.dart';

class rowFile extends StatelessWidget {
  var textString;
  var widgetInfo;
  rowFile(this.textString, this.widgetInfo);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child:ListTile(
          leading: Icon(
            widgetInfo,
            size: 40,
          ),
          title: Text(textString),
        ) ,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
         
      ),
    );
  }
}
