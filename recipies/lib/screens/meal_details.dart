import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  final String title;
  final String id;
  final String imgUrl;
  final List<Object> ingrediants;
  final List<Object> Steps;
  const MealDetails(
      {Key? key,
      required this.title,
      required this.id,
      required this.imgUrl,
      required this.ingrediants,
      required this.Steps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  imgUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Ingrediants',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              CustomContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      ingrediants[index].toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                },
                itemCount: ingrediants.length,
              )),
              const  Text(
                'Steps',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              CustomContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(Steps[index].toString()),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: Steps.length,
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}

Widget CustomContainer(Widget child) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      height: 250,
      width: 400,
      child: child);
}
