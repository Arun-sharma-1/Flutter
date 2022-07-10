import 'my_booking_screen.dart';
import 'package:intl/intl.dart';
import 'package:assign/widgets/title_dart.dart';
import 'package:flutter/material.dart';
import '../default-style.dart';
import 'package:provider/provider.dart';
import '../modal/blood_bank_list.dart';
import '../modal/bookings.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = 'booking-screen';
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var date = DateTime.now();
  String selectedBloodGroup = 'O+';
  List<String> bloodGroups = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-'];

  Future<void> selectDate() async {
    final newdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (newdate == null) return;
    setState(() {
      date = newdate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String bankId = ModalRoute.of(context)!.settings.arguments as String;
    final BankData = Provider.of<BankList>(context);
    final myBank = BankData.bankdetails.firstWhere((element) => element.id == bankId);
    return Scaffold(
      backgroundColor: Color(0xFFF46A6A),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Titles(title: 'Book Slot'),
                  SubTitle(subtitle: myBank.bloodBankName),
                ],
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.92),
              width: double.infinity,
              height: 60,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleContainer(context, 'Select Blood Group'),
                  SizedBox(
                    width: 55,
                    child: buildDropdownButton(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white.withOpacity(0.92),
              width: double.infinity,
              height: 60,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleContainer(context, 'Select Date'),
                  customTextButton(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final bookings = Provider.of<AllBookings>(context,listen: false);
                  bookings.add(myBank.bloodBankName, myBank.distance, myBank.id);
                  Navigator.of(context)
                      .pushNamed(MyBookingScreen.routeName, arguments: {
                    'date': date,
                    'bloodBankName': myBank.bloodBankName,
                  });
                },
                child: Text(
                  '   OK     ',
                  style: kstyle.copyWith(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextButton customTextButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      onPressed: selectDate,
      child: Text(DateFormat('dd MMMM').format(date), style: kstyle),
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton(
      icon: Container(
          margin: EdgeInsets.only(left: 5),
          color: Colors.black,
          child: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          )),
      iconSize: 28,
      items: bloodGroups.map((bloodgroup) {
        return DropdownMenuItem<String>(
          child: Text(bloodgroup, style: kstyle),
          value: bloodgroup,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedBloodGroup = value.toString();
        });
      },
      value: selectedBloodGroup,
    );
  }

  Container titleContainer(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(
        left: 50,
      ),
      width: MediaQuery.of(context).size.width * 0.45,
      child: Text(text, style: kstyle),
    );
  }
}
