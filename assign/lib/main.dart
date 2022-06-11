import 'package:flutter/material.dart';

void main() => runApp(MyBar());

class MyBar extends StatefulWidget {
  const MyBar({Key? key}) : super(key: key);

  @override
  State<MyBar> createState() => _MyBarState();
}

class _MyBarState extends State<MyBar> {
  var percentage = 50.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${percentage.toString()} %'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (percentage > 0) percentage--;
                          });
                        },
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: Container(
                            height: 15,
                            width: percentage,
                            color: Colors.blue,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 15,
                            width: percentage,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (percentage > 0 && percentage < 100)
                              percentage++;
                          });
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
