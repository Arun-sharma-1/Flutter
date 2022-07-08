import 'package:flutter/material.dart';
import '../provider/itemList_provider.dart';
import 'package:provider/provider.dart';
import '../provider/item_list.dart';

Widget CustomListTile(Function changeImg, BuildContext context, String text) {
  return Column(
    children: [
      const Divider(),
      GestureDetector(
        onTap: () {
          // productFile.updateImage(productId, Image.asset('assets/$text.png'));
          // changeImg(AssetImage("assets/$text.png"));
          changeImg(Image.asset('assets/$text.png'));
          Navigator.of(context).pop();
        },
        child: ListTile(
          leading: Image(image: AssetImage("assets/$text.png")),
          title: Text(text),
          trailing: const Text('box'),
        ),
      ),
    ],
  );
}

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final _priceController = TextEditingController();
  final _remarkController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _priceController;
    _remarkController;
    super.dispose();
  }

  Image img = Image.asset('assets/beauty.png');
  void changeImg(Image newimg) {
    setState(() {
      img = newimg;
    });
  }

  String text = '';

  String selectedImg(Image img) {
    String starting = img.image.toString().substring(39);
    int index = starting.indexOf('.png")');
    starting = starting.replaceRange(index, index + 6, '');
    return starting;
  }

  @override
  Widget build(BuildContext context) {
    final isportrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isportrait? Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Choose Category'),
                GestureDetector(
                    onTap: () {
                      // print(img.image.toString().substring(39, 45));
                      // print(selectedImg(img));
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return  Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomListTile(changeImg, context, 'baby'),
                                    CustomListTile(
                                        changeImg, context, 'beauty'),
                                    CustomListTile(changeImg, context, 'bills'),
                                    CustomListTile(changeImg, context, 'book'),
                                    CustomListTile(changeImg, context, 'car'),
                                    CustomListTile(
                                        changeImg, context, 'clothing'),
                                    CustomListTile(
                                        changeImg, context, 'education'),
                                    CustomListTile(
                                        changeImg, context, 'electronics'),
                                    CustomListTile(
                                        changeImg, context, 'ensurance'),
                                    CustomListTile(
                                        changeImg, context, 'entertainment'),
                                    CustomListTile(changeImg, context, 'food'),
                                    CustomListTile(
                                        changeImg, context, 'fruits'),
                                    CustomListTile(changeImg, context, 'gift'),
                                    CustomListTile(
                                        changeImg, context, 'health'),
                                    CustomListTile(changeImg, context, 'home'),
                                    CustomListTile(
                                        changeImg, context, 'maintenance'),
                                    CustomListTile(
                                        changeImg, context, 'office'),
                                    CustomListTile(
                                        changeImg, context, 'others'),
                                    CustomListTile(
                                        changeImg, context, 'sports'),
                                    CustomListTile(changeImg, context, 'wine'),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(width: 50, height: 50, child: img))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _priceController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Price'),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: _remarkController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Remarks'),
                    ))
              ],
            ),
            FlatButton(
              onPressed: () {
                Provider.of<Items>(context, listen: false).addProduct(ItemList(
                    img: img,
                    date: DateTime.now(),
                    time: TimeOfDay.now(),
                    remark: _remarkController.text,
                    title: selectedImg(img),
                    price: double.parse(_priceController.text),
                    id: DateTime.now().toIso8601String()));
                Navigator.of(context).pop();
              },
              child: Text('Add '),
              minWidth: double.infinity,
              color: Colors.deepPurple.withOpacity(0.5),
            )
          ],
        ),
      ),
    ) : Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Colors.white),
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Choose Category'),
                GestureDetector(
                    onTap: () {
                      // print(img.image.toString().substring(39, 45));
                      // print(selectedImg(img));
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return  Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomListTile(changeImg, context, 'baby'),
                                    CustomListTile(
                                        changeImg, context, 'beauty'),
                                    CustomListTile(changeImg, context, 'bills'),
                                    CustomListTile(changeImg, context, 'book'),
                                    CustomListTile(changeImg, context, 'car'),
                                    CustomListTile(
                                        changeImg, context, 'clothing'),
                                    CustomListTile(
                                        changeImg, context, 'education'),
                                    CustomListTile(
                                        changeImg, context, 'electronics'),
                                    CustomListTile(
                                        changeImg, context, 'ensurance'),
                                    CustomListTile(
                                        changeImg, context, 'entertainment'),
                                    CustomListTile(changeImg, context, 'food'),
                                    CustomListTile(
                                        changeImg, context, 'fruits'),
                                    CustomListTile(changeImg, context, 'gift'),
                                    CustomListTile(
                                        changeImg, context, 'health'),
                                    CustomListTile(changeImg, context, 'home'),
                                    CustomListTile(
                                        changeImg, context, 'maintenance'),
                                    CustomListTile(
                                        changeImg, context, 'office'),
                                    CustomListTile(
                                        changeImg, context, 'others'),
                                    CustomListTile(
                                        changeImg, context, 'sports'),
                                    CustomListTile(changeImg, context, 'wine'),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(width: 50, height: 50, child: img))
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      controller: _priceController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Price'),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: _remarkController,
                      textInputAction: TextInputAction.next,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Remarks'),
                    ))
              ],
            ),
            FlatButton(
              onPressed: () {
                Provider.of<Items>(context, listen: false).addProduct(ItemList(
                    img: img,
                    date: DateTime.now(),
                    time: TimeOfDay.now(),
                    remark: _remarkController.text,
                    title: selectedImg(img),
                    price: double.parse(_priceController.text),
                    id: DateTime.now().toIso8601String()));
                Navigator.of(context).pop();
              },
              child: Text('Add '),
              minWidth: double.infinity,
              color: Colors.deepPurple.withOpacity(0.5),
            )
          ],
        ),
      ),
    ) ;

  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value ',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
