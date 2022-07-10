import 'package:flutter/material.dart';
import 'blood_bank_list.dart';

class AllBookings extends ChangeNotifier {
  List bookings = [];

  void add(String bloodBankName, double distance, String id) {
    bookings.add(
        BankDetails(bloodBankName: bloodBankName, distance: distance, id: id)
    );
    print(bookings[0].bloodBankName);
  }

}
