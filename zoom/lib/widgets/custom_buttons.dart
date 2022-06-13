import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class CustomButtons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButtons({Key? key, required this.text , required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(
            double.infinity,
            45
          ),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
