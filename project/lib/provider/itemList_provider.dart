import 'package:flutter/material.dart';
import 'package:project/widgets/product_item.dart';
import 'item_list.dart';

class Items with ChangeNotifier {
  List<ItemList> products = [
    ItemList(
        img: Image.asset("assets/food.png"),
        title: 'Food',
        time: TimeOfDay.now(),
        price: 500,
        date: DateTime.now(),
        remark: 'aa',
        id: DateTime.now().toString()),
    ItemList(
        img: Image.asset("assets/wine.png"),
        title: 'wine',
        price: 550,
        time: TimeOfDay.now(),
        date: DateTime.now(),
        remark: 'aa',
        id: DateTime.now().toString()),
    ItemList(
        img: Image.asset("assets/sports.png"),
        title: 'Sports',
        time: TimeOfDay.now(),
        date: DateTime.now(),
        price: 400,
        remark: 'aa',
        id: DateTime.now().toString()),
  ];

  List<ItemList> get items {
    return [...products];
  }

  double get totalExpances {
    double _total = 0.0;
    items.forEach((element) {
      _total += element.price;
    });
    return _total;
  }

  void deleteProduct(String id) {
    products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateProduct(ItemList item) {
    final newItem = ItemList(
        img: item.img,
        date: item.date,
        time: item.time,
        remark: item.remark,
        title: item.title,
        price: item.price,
        id: item.id);
    notifyListeners();
  }

  void updateDate(String productId, DateTime date) {
    final item = products.firstWhere((element) => element.id == productId);
    final prodIndex = products.indexWhere((element) => element.id == productId);
    final newItem = ItemList(
        img: item.img,
        date: date,
        remark: item.remark,
        time: item.time,
        title: item.title,
        price: item.price,
        id: item.id);
    products[prodIndex] = newItem;
    notifyListeners();
  }

  void updatePrice(String productId, double price) {
    final item = products.firstWhere((element) => element.id == productId);
    final prodIndex = products.indexWhere((element) => element.id == productId);
    final newItem = ItemList(
        img: item.img,
        date: item.date,
        remark: item.remark,
        time: item.time,
        title: item.title,
        price: price,
        id: item.id);
    products[prodIndex] = newItem;
    notifyListeners();
  }

  void updateTime(String productId, TimeOfDay? time) {
    final item = products.firstWhere((element) => element.id == productId);
    final prodIndex = products.indexWhere((element) => element.id == productId);
    final newItem = ItemList(
        img: item.img,
        date: item.date,
        remark: item.remark,
        title: item.title,
        time: time!,
        price: item.price,
        id: item.id);
    products[prodIndex] = newItem;
    notifyListeners();
  }

  void updateImage(String productId, Image image) {
    final item = products.firstWhere((element) => element.id == productId);
    final itemIndex = products.indexWhere((element) => element.id == productId);
    final newItem = ItemList(
        img: image,
        date: item.date,
        remark: item.remark,
        title: item.title,
        time: item.time,
        price: item.price,
        id: item.id);

    products[itemIndex] = newItem;
    notifyListeners();
  }

  void addProduct(ItemList item) {
    products.insert(0, item);
    notifyListeners();
  }

  void retreiveDate(String productId, DateTime date, TimeOfDay time) {
    final product = products.firstWhere((element) => element.id == productId);
    final productIndex =
        products.indexWhere((element) => element.id == productId);

    final newProduct = ItemList(
        remark: product.remark,
        id: product.id,
        date: date,
        time: time,
        img: product.img,
        title: product.title,
        price: product.price);

    products[productIndex] = newProduct;
    print(date);
    notifyListeners();
  }
}
