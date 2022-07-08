import 'package:flutter/material.dart';
import '../widgets/title_dart.dart';
import '../modal/blood_bank_list.dart';
import 'booking_screen.dart';

class DonateBloodScreen extends StatelessWidget {
  static String routeName = 'listbank';
  @override
  Widget build(BuildContext context) {
    BloodBankList b = new BloodBankList();

    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Titles(title: 'Donate Blood'),
                SubTitle(subtitle: 'Find nearby blood banks'),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  // listview cann't be used directly inside column
                  child: ListView.builder(
                      itemCount: b.getLength,
                      itemBuilder: (context, index) {
                        return BloodBankInfo(
                          bloodBanks: b.bloodBanks,
                          index: index,
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

class BloodBankInfo extends StatelessWidget {
  const BloodBankInfo({
    Key? key,
    required this.bloodBanks,
    required this.index,
  }) : super(key: key);

  final Map<String, double> bloodBanks;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(BookingScreen.routeName);
      },
      child: Card(
        child: ListTile(
          leading: Chip(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          trailing: Text('${bloodBanks.values.toList()[index].toString()} km'),
        ),
      ),
    );
  }
}
