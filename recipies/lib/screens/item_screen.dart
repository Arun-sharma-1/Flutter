import 'package:flutter/material.dart';
import '../screens/meal_details.dart';


class ItemScreen extends StatelessWidget {
  static String routeName = 'itemscreen';
  final String id;
  final String title;
  final String imagUrl;
  final int duration;
  final List<String> ingrediants;
  final List<String> Steps;
  final Function removeItem;
  const ItemScreen(
      {Key? key,
      required this.title,
      required this.id,
      required this.imagUrl,
      required this.duration,
      required this.ingrediants,
      required this.Steps,
      required this.removeItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return MealDetails(
            id: id,
            title: title,
            imgUrl: imagUrl,
            ingrediants: ingrediants,
            Steps: Steps,
          );
        })).then((result) {
          if (result != null) {
            removeItem(result);
          }
        });
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius:const  BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imagUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Container(
                  width: 300,
                  color: Colors.black38,
                  child: Text(
                    title,
                    style:const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.timer),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('${duration} min'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
