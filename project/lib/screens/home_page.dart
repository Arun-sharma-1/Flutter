import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project/provider/itemList_provider.dart';
import 'package:project/widgets/productDetails.dart';
import 'package:provider/provider.dart';
import '../constant/kstyle.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  double progress = 0;
  currentProgressColor() {
    if (progress >= 0.6 && progress < 0.8) {
      return Colors.orange;
    }
    if (progress >= 0.8) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<Items>(context);
    final listItems = listData.itemdetail;
    DateTime date = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white70),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        '${date.year}-${date.month.toString().padLeft(2, '0')} Balance',
                        style: kstyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    '-666',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Expences: -666',
                    style: kstyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'income 0',
                    style: kstyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Budget Setting',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //Todo:progess bar indicator
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Colors.lightBlue.shade100,
                                  Colors.lightGreen.shade100
                                ])),
                            child: LinearPercentIndicator(
                                padding: const EdgeInsets.all(0),
                                animation: true,
                                barRadius: Radius.circular(5),
                                lineHeight: 15,
                                animationDuration: 1000,
                                percent: 0.8,
                                progressColor: currentProgressColor()),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 219, 224, 224),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat.yMMMd().format(date)),
                              Text('Total Expances - ${listData.totalExpances}')
                            ],
                          ),
                        );
                      }
                      index -= 1;
                      return ProductDetails(
                          img: listItems[index].img,
                          title: listItems[index].title,
                          price: listItems[index].price);
                    },
                    itemCount: listItems == null ? 1 : listItems.length + 1,
                  ),
                ),
                // Image.asset("food.png")
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: GNav(
          activeColor: Colors.deepPurple,
          tabBackgroundColor: const Color.fromARGB(255, 202, 222, 220),
          gap: 8,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            print(index);
          },
          backgroundColor: Colors.white,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'home',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'search',
            ),
            GButton(
              icon: Icons.settings,
              text: 'settting',
            )
          ]),
    );
  }
}
