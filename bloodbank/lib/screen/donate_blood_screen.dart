import 'package:assign/default-style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/title_dart.dart';
import '../modal/blood_bank_list.dart';
import 'booking_screen.dart';
import '../widgets/blood_bank_info.dart';
import 'my_booking_screen.dart';

class DonateBloodScreen extends StatelessWidget {
  static String routeName = 'listbank';
  @override
  Widget build(BuildContext context) {
    final BankListData = Provider.of<BankList>(context);
    return Scaffold(
        backgroundColor: Color(0xFFF46A6A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF46A6A),
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width *0.6,
          child: Drawer(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Be the reason for someone\'s heartbeat...',
                    style: kstyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.bloodtype_outlined , size: 50,color: Colors.black),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(MyBookingScreen.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          child: Text('My bookings'),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.red,
                                ],
                                stops: [
                                  0.0,
                                  1.0
                                ],
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomRight,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
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
                      itemCount: BankListData.getLength,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                BookingScreen.routeName,
                                arguments:
                                    BankListData.bankdetails[index].id);
                          },
                          child: BloodBankInfo(
                            title: BankListData.bankdetails[index].bloodBankName,
                            trialing:
                                '${BankListData.bankdetails[index].distance.toString()} km',
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
