import 'package:demo/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class EditProductScreen extends StatefulWidget {
  static String routeName = 'editproductscreen';
  // final String id;

  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final imageUrlcontroller = TextEditingController();
  var _isInit = true;
  var _isLoading = false;
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: '', title: '', description: '', imageUrl: '', price: 0.0);

  var _initValues = {
    'title': ' ',
    'description': ' ',
    'price': ' ',
    'imageUrl': ' '
  };

  @override
  void dispose() {
    // TODO: implement dispose
    imageUrlcontroller.dispose();
    super.dispose();
  }

  //Todo:changeDependecies creating error
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      final id = ModalRoute.of(context)!.settings.arguments as String?;
      if (id != null) {
        _editedProduct = Provider.of<Products>(context)
            .items
            .firstWhere((element) => element.id == id);
        //In edit section we are getting the initial values the product which we want to update
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl
        };
        imageUrlcontroller.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _form.currentState?.save();
    try {
      if (_editedProduct.id != '') {
        await Provider.of<Products>(context, listen: false)
            .updateProduct(_editedProduct.id, _editedProduct);
      } else {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('An error occured'),
                content: Text('Something went wrong!'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay'))
                ],
              ));
    } finally {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final url = Uri.https(authority, unencodedPath)
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit products'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: InputDecoration(labelText: 'title'),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: value!,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PLease provide a value';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: InputDecoration(labelText: 'price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            price: double.parse(value!),
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PLease provide a value';
                        }
                        if (double.tryParse(value) == null) {
                          return 'please enter a valid number';
                        }
                        if (double.parse(value) <= 0) {
                          return 'please enter a number greater than 0';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: value!,
                            imageUrl: _editedProduct.imageUrl);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PLease provide a value';
                        }
                        if (value.length < 10) {
                          return 'Should be greater than 10';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: imageUrlcontroller.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    imageUrlcontroller.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: imageUrlcontroller,
                            // focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an image URL.';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: value!,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
