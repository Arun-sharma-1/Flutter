import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../modals/httpexception.dart';

class Auth with ChangeNotifier {
  var _token;
  var _expiryDate;
  var _userId;

  bool get isAuth {
    if (_token == null) {
      return false;
    }
    return true;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return '';
  }

  Future<void> authenticate(
      String email, String password, String segment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$segment?key=AIzaSyC09M4Duj85ih14ep0B-5a-DUsDsQWtw7k');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      print('here');
      final responseData = json.decode(response.body);
      print(responseData.body);
      if (responseData['error'] != null) {
        throw HTTPException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    // return authenticate(email, password, 'signUp');
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC09M4Duj85ih14ep0B-5a-DUsDsQWtw7k');
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      print(json.decode(response.body));

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HTTPException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String email, String password) async {
    // return authenticate(email, password, 'verifyPassword');
    print(_token);

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC09M4Duj85ih14ep0B-5a-DUsDsQWtw7k');
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      print(json.decode(response.body));

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HTTPException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
