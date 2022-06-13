import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';
import './videoCall_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPressedChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Meet and Chat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPressedChange, // returns an int value
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet and chat'),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: 'Clock'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Setting'),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeIcon(
            title: 'New meeting',
            onPressed: () {
              Navigator.pushNamed(context, VideoCall.id);
            },
            icon: Icons.videocam,
          ),
          HomeIcon(
            title: 'Join meeting',
            onPressed: () {},
            icon: Icons.add_box_rounded,
          ),
          HomeIcon(
            title: 'Schedule',
            onPressed: () {},
            icon: Icons.calendar_today,
          ),HomeIcon(
            title: 'Share Screen',
            onPressed: () {},
            icon: Icons.arrow_circle_up,
          ),
        ],
      ),
    );
  }
}

class HomeIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const HomeIcon(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                ),
                child: Icon(
                  icon,
                  size: 35,
                ),
              ),
            ],
          ),
          Text(title)
        ],
      ),
    );
  }
}
