import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../default-style.dart';

class BloodBankInfo extends StatelessWidget {
  final String title;
  final String trialing;

  BloodBankInfo({required this.title, required this.trialing});

  @override
  Widget build(BuildContext context) {
    final int index = title.indexOf('Blood');
    final String bloodBankName = title.substring(0, index);
    return Card(
      color: Colors.white.withOpacity(0.7),
      child: ListTile(
        leading: leadingWidget(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bloodBankName,
              style: kstyle,
            ),
            Text(
              'Blood Bank',
              style: kstyle,
            ),
          ],
        ),
        trailing: Text(trialing),
      ),
    );
  }
}

Container leadingWidget() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.30),
      borderRadius: BorderRadius.circular(8),
    ),
    child: CircleAvatar(
      radius: 8,
      backgroundColor: Colors.red,
    ),
  );
}

class GenricInfoCard extends StatefulWidget {
  const GenricInfoCard({Key? key, required this.title, required this.trialing})
      : super(key: key);

  final String title;
  final DateTime trialing;

  @override
  State<GenricInfoCard> createState() => _GenricInfoCardState();
}

class _GenricInfoCardState extends State<GenricInfoCard> {
  String bloodBankName = '';
  String secondTitle='';
  @override
  Widget build(BuildContext context) {
    setState(() {
      final tempTitle = widget.title.toLowerCase();
      final int index = tempTitle.indexOf('blood');
      if (index != -1) {
        bloodBankName = widget.title.substring(0, index);
        secondTitle = widget.title.substring(index);

      }
      if (index == -1) {
        secondTitle = '';
      }
    });

    return Card(
      color: Colors.white.withOpacity(0.6),
      child: ListTile(
        leading: leadingWidget(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${bloodBankName[0].toUpperCase()}${bloodBankName.substring(1).toLowerCase()}",
              style: kstyle,
            ),
            Text(
              secondTitle,
              style: kstyle,
            ),
          ],
        ),
        trailing: Text(DateFormat('dd MMMM y').format(widget.trialing),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16)),
      ),
    );
  }
}
