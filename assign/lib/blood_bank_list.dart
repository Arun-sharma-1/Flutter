import 'package:flutter/material.dart';

class BloodBankList extends StatelessWidget {
  static String routeName = 'listbank';
  final Map<String, double> bloodBanks = {
    "Sarita Blood Bank": 1.0,
    "Red Cross Blood Bank": 2.5,
    "Leelavati Blood Bank": 7.0,
    "Ram Blood Bank": 5.5,
    "People Blood Bank": 2
  };

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Donate Blood',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Text(
                  'Find nearby blood banks',
                  style: TextStyle(color: Colors.white, letterSpacing: 1),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  // listview cann't be used directly inside column
                  child: ListView.builder(
                      itemCount: bloodBanks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Chip(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              label: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            title: Text(
                              bloodBanks.keys.toList()[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                                '${bloodBanks.values.toList()[index].toString()} km'),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
