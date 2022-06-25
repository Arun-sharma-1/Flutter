import 'package:flutter/material.dart';
import 'blood_bank_list.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'loginscreen';
  final String? email;
  const LoginScreen({Key? key, this.email}) : super(key: key);

  Future DonateIndicator(context) async {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 1,
          ));
        });
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body:SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Your blood can save lives',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Logged  in as $email ',
                  style: TextStyle(
                      fontSize: 25, color: Colors.white, letterSpacing: 1),
                ),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        //Todo: Move to next screen with dealy of 3 sec
                        Navigator.of(context).pushNamed(BloodBankList.routeName);
                        DonateIndicator(context);

                      },
                      child: Text('Donate Blood')),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: Colors.white,
                          onPrimary: Colors.red),
                      onPressed: () {},
                      child: Text('Get Blood')),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
