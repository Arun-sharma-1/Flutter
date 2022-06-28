import 'package:flutter/material.dart';
import 'package:project/constant/kstyle.dart';
import 'package:provider/provider.dart';
import '../provider/itemList_provider.dart';
import 'package:intl/intl.dart';
import '../screens/icon_edit_screen.dart';

class EditScreen extends StatefulWidget {
  static String routeName = 'editscreen';
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var date = null;
  TimeOfDay? time;

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 10);
    final newTime =
        await showTimePicker(context: context, initialTime: initialTime);

    if (newTime == null) return;
    setState(() {
      time = newTime.replacing(hour: newTime.hourOfPeriod);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String?;
    final productFile = Provider.of<Items>(context);
    final product =
        productFile.items.firstWhere((element) => element.id == productId);
    final productDate = DateFormat('EEEE d MMM y').format(product.date);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_outline),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Material(
            elevation: 10,
            child: Container(
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Todo: Add  Navigation  to change image
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return IconEditScreen(
                                productId: productId!,
                              );
                            });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 50,
                        height: 50,
                        child: product.img,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.price.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '=',
                          style: whiteColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              // margin: EdgeInsets.all(2),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await pickDate(context);
                      Provider.of<Items>(context, listen: false)
                          .updateDate(productId!, date);
                    },
                    child: CustomIcon(
                        Icons.calendar_month, ' Date ', productDate.toString(),
                        trailIcon: Icons.keyboard_arrow_right),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await pickTime(context);
                      Provider.of<Items>(context, listen: false)
                          .updateTime(productId!, time);
                    },
                    child: CustomIcon(
                        Icons.access_time,
                        'Time ',
                        product.time.toString().substring(10, 15) +
                            ' ' +
                            product.time.period.toString().substring(10),
                        trailIcon: Icons.keyboard_arrow_right),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: CustomIcon(Icons.edit, ' ', 'Remarks')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget CustomIcon(IconData icon, String startingText, String title,
    {IconData? trailIcon}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          size: 30,
          color: Colors.black,
        ),
      ),
      title: Row(
        children: [
          Text(startingText,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(title)
        ],
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        child: Icon(
          trailIcon,
          size: 25,
          color: Colors.black,
        ),
      ),
    ),
  );
}
