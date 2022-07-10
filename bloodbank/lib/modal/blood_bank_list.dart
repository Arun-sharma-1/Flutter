import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankDetails {
  final String bloodBankName;
  final double distance;
  final String id;

  BankDetails(
      {required this.bloodBankName, required this.distance, required this.id});
}

class BankList with ChangeNotifier {
  List<BankDetails> banks = [
    BankDetails(
        bloodBankName: "Sarita Blood Bank",
        distance: 1.0,
        id: DateTime.now().toIso8601String()),
    BankDetails(
        bloodBankName: "Red Cross Blood Bank",
        distance: 7.0,
        id: DateTime.now().toIso8601String()),
    BankDetails(
        bloodBankName: "Leelavati Blood Bank",
        distance: 3.0,
        id: DateTime.now().toIso8601String()),
    BankDetails(
        bloodBankName: "Ram Blood Bank",
        distance: 5.5,
        id: DateTime.now().toIso8601String()),
    BankDetails(
        bloodBankName: "People Blood Bank",
        distance: 2.0,
        id: DateTime.now().toIso8601String()),
  ];

  List get bankdetails {
    return [...banks];
  }

  int get getLength {
    return banks.length;
  }
}
