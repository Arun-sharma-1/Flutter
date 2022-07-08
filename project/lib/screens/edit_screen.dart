import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/constant/kstyle.dart';
import 'package:provider/provider.dart';
import '../provider/itemList_provider.dart';
import 'package:intl/intl.dart';
import '../screens/icon_edit_screen.dart';
import '../widgets/custom_slideup_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:math_expressions/math_expressions.dart';

class EditScreen extends StatefulWidget {
  static String routeName = 'editscreen';
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  // final _panelController = PanelController();

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

  //
  // void tooglePanel() => _panelController.isPanelOpen
  //     ? _panelController.close
  //     : _panelController.open();
  // void closePanel() {
  //   setState(() {
  //     _panelController.isPanelOpen
  //         ? _panelController.close()
  //         : _panelController.close();
  //   });

  var firstNum;
  var secondNum;
  var operation;
  var res = '';
  var textTodisplay = '';
  var history = '';
  var endRes = '';

  var equation = '';
  var expression = '';

  void btnOnClick(String btnValue) {
    print(btnValue);
    if (btnValue == 'C') {
      if (equation == "") {
        equation = "0";
      }
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else if (btnValue == 'AC') {
      textTodisplay = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'x' ||
        btnValue == '÷') {
      firstNum = int.parse(textTodisplay);
      res = '';
      operation = btnValue;
    } else if (btnValue == '=') {
      // secondNum = int.parse(textTodisplay);
      // if (operation == '+') {
      //   res = (firstNum + secondNum).toString();
      //   history =
      //       firstNum.toString() + operation.toString() + secondNum.toString();
      // }
      // if (operation == '-') {
      //   res = (firstNum - secondNum).toString();
      //   history =
      //       firstNum.toString() + operation.toString() + secondNum.toString();
      // }
      // if (operation == 'x') {
      //   res = (firstNum * secondNum).toString();
      //   history =
      //       firstNum.toString() + operation.toString() + secondNum.toString();
      // }
      // if (operation == '÷') {
      //   res = (firstNum / secondNum).toString();
      //   history =
      //       firstNum.toString() + operation.toString() + secondNum.toString();
      // }
      expression = equation;
      try {
        Parser p = new Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        res = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        print(e);
      }
    } else {
      res = int.parse(textTodisplay + btnValue).toString();
      // history  = history +  res;
    }
    setState(() {
      textTodisplay = res;
      endRes = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productFile = Provider.of<Items>(context);
    final product =
        productFile.items.firstWhere((element) => element.id == productId);
    final productDate = DateFormat('EEEE d MMM y').format(product.date);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              return showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Action Saved'),
                  content: Text('Details are updated !'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          productFile.updatePrice(
                              productId, double.parse(endRes));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok'))
                  ],
                ),
              );
            },
            icon: const Icon(Icons.done_outline),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            // productFile.retreiveDate(productId, date, time);
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                //Todo:
                child: Material(
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
                                      productId: productId,
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
                                history != ''
                                    ? endRes
                                    : product.price.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                '= ${textTodisplay}',
                                style: whiteColor,
                              )
                            ],
                          )
                        ],
                      ),
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
                              .updateDate(productId, date);
                        },
                        child: CustomIcon(Icons.calendar_month, 'Date ',
                            productDate.toString(),
                            trailIcon: Icons.keyboard_arrow_right),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await pickTime(context);
                          Provider.of<Items>(context, listen: false)
                              .updateTime(productId, time);
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
              ),
            ],
          ),
          SlidingUpPanel(
              // controller: _panelController,
              maxHeight: MediaQuery.of(context).size.height * 0.49,
              minHeight: MediaQuery.of(context).size.height * 0.025,
              panel: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    GestureDetector(
                      // onTap: tooglePanel,
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 40,
                              margin: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomButton(
                          title: 'AC',
                          onTap: btnOnClick,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: 'C', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '.', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '-', onTap: btnOnClick),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomButton(title: '7', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '8', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '9', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '÷', onTap: btnOnClick)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomButton(title: '4', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '5', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '6', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: 'x', onTap: btnOnClick)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomButton(title: '1', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '2', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '3', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '+', onTap: btnOnClick),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomButton(title: '+/-', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(title: '0', onTap: btnOnClick),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                          title: '00',
                          onTap: btnOnClick,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                          title: '=',
                          onTap: btnOnClick,
                          backcolor: Colors.green,
                          fontcolor: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ))
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
          FittedBox(
              child: Text(
            title,
            style: TextStyle(fontSize: 14),
          ))
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

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  Color fontcolor;
  double size;
  Color backcolor;
  CustomButton(
      {required this.title,
      required this.onTap,
      this.size = 25,
      this.fontcolor = Colors.black,
      this.backcolor = Colors.white});
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(title),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Color.fromRGBO(82, 80, 75, 100),
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
