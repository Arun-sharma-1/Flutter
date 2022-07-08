import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../modals/httpexception.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];
  final authToken;
  Products(this.authToken, this._items);

  List<Product> get items {
    return [..._items]; // returning copy of each items
  }

  List<Product> get favItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/products.json?auth=$authToken');
    try {
      final responce = await http.get(url);
      final extractedData = json.decode(responce.body) as Map<String, dynamic>;
      List<Product> loadedProduct = [];
      extractedData.forEach((prodId, prodValue) {
        loadedProduct.add(Product(
            id: prodId,
            title: prodValue['title'],
            description: prodValue['description'],
            imageUrl: prodValue['imageUrl'],
            isFavorite: prodValue['isFavorite'],
            price: prodValue['price']));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/products.json?auth=$authToken');
    try {
      final responce = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite
          }));

      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(responce.body)['name'],
      );
      // _items.add(newProduct);
      _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (e) {
      throw e;
    }

    // print(json.decode(responce.body));  firebase create unique id
  }

  Future<void> updateProduct(String id, Product product) async {
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
    try {
      await http.patch(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
          }));
      final prodIndex = _items.indexWhere((element) => element.id == id);
      if (prodIndex >= 0) _items[prodIndex] = product;

      notifyListeners();
    } catch (e) {
      // if you want to retrieve the old data then hold http.path in variable and then responce.status code inside try and then retrieve it
      //inside catch retriving is not possible for path , put ,delete
      print(e);
    }
  }

  Future<void> deleteProduct(String id) async {
    //optimistic approach -> we roll back if the item is not deleted
    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
    final existingProdIndex = _items.indexWhere((element) => element.id == id);
    var existingProduct = _items[existingProdIndex];
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
    final responce = await http.delete(url);
    if (responce.statusCode >= 400) {
      _items.insert(existingProdIndex, existingProduct);
      notifyListeners();
      throw HTTPException('Could not delete product');
    } else {
      existingProduct =
          Product(id: '', title: '', description: '', imageUrl: '', price: 0.0);
      notifyListeners();
    }
  }

  void toggleFavoriteTracker(String productId) {
    final product = _items.firstWhere((element) => element.id == productId);

    final url = Uri.parse(
        'https://arunsshop-972c0-default-rtdb.firebaseio.com/products/$productId.json');
    http.patch(url, body: json.encode({'isFavorite': product.isFavorite}));
    notifyListeners();
  }
}
