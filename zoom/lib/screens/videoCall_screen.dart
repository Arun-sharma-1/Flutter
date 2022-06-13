import 'package:flutter/material.dart';
import '../utils/colors.dart';

class VideoCall extends StatefulWidget {
  static String id = 'video-call';
  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final idController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join a Meeting'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          TextFieldWidget(
            Controller: idController,
            title: 'Room ID',
          ),
          SizedBox(
            height: 15,
          ),
          TextFieldWidget(
            Controller: nameController,
            title: 'Enter your Name',
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController Controller;

  const TextFieldWidget({
    Key? key,
    required this.title,
    required this.Controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controller,
      textAlign: TextAlign.center,
      maxLines: 1, // ????
      decoration: InputDecoration(
          hintText: title,
          fillColor: secondaryBackgroundColor,
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
    );
  }
}
