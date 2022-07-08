import 'package:demo/screens/try.dart';
import 'package:flutter/material.dart';
import '../provider/auth.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../modals/httpexception.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: devicesize.width,
            height: devicesize.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 94.0),
                    transform: Matrix4.rotationZ(-0.8 * pi / 18)
                      ..translate(-10.0),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade900,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 8,
                              color: Colors.black,
                              offset: Offset(0, 2))
                        ]),
                    child: const Text(
                      'My Shop',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Flexible(
                    flex: devicesize.width > 600 ? 2 : 1, child: AuthCard())
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> authData = {'email': '', 'password': ''};
  final _passwordController = TextEditingController();
  var _isloading = false;

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('An error Occured!'),
              content: Text(message),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  Future<void> _submit() async {
    _formKey.currentState!.save();
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      // Invalid!
      return;
    }
    setState(() {
      _isloading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        //log in
        await Provider.of<Auth>(context, listen: false)
            .login(authData['email']!, authData['password']!);
      } else {
        // Sign user
        await Provider.of<Auth>(context, listen: false)
            .signup(authData['email']!, authData['password']!);
      }
    } on HTTPException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.returnMsg().contains('EMAIL_EXISTS')) {
        errorMessage = 'This Email Address already exists';
      } else if (error.returnMsg().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not valid email address';
      } else if (error.returnMsg().contains('WEAK_PASSWORD')) {
        errorMessage = 'Weak password ';
      } else if (error.returnMsg().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email not found';
      } else if (error.returnMsg().contains('INVALID_PASSWORD')) {
        errorMessage = 'wrong password! Try again ';
      } else if (error.returnMsg().contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
        errorMessage = 'Too many attemptes Try again later';
      } else if (error.returnMsg().contains('OPERATION_NOT_ALLOWED')) {
        errorMessage = 'OPERATION_NOT_ALLOWED';
      }

      _showErrorDialog(errorMessage);
    } catch (error) {
      // var errorMessage = 'Could no authenticate you, please try again later ';
      _showErrorDialog(error.toString());
    }
    setState(() {
      _isloading = false;
    });
  }

  void switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: _authMode == AuthMode.Signup ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 280),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      authData['email'] = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    keyboardType: TextInputType.number,
                    controller: _passwordController,
                    onSaved: (value) {
                      authData['password'] = value!;
                    },
                    validator: (value) {
                      if (value!.length < 5) {
                        return 'password is too shart';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //ONE MORE TEXT FIELD IN PARTICULAR CONDITION
                  if (_authMode == AuthMode.Signup)
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Confirm password'),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'password dosent match';
                        }
                        return null;
                      },
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  _isloading
                      ? CircularProgressIndicator(
                          strokeWidth: 1,
                        )
                      : ElevatedButton(
                          onPressed: _submit,
                          child: _authMode == AuthMode.Login
                              ? Text('Login')
                              : Text('SignUp'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 4),
                      ),
                      onPressed: switchAuthMode,
                      child: _authMode == AuthMode.Signup
                          ? const Text('LOGIN INSTEAD')
                          : const Text('SIGNUP INSTEAD'))
                ],
              ),
            )),
      ),
    );
  }
}
