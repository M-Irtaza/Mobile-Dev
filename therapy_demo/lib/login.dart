import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static const route = '/login';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHidden = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) return 'Enter Password';
    final regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 charactes long containing at least one uppercase letter, one number and one special character';
    }
    return null;
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    //Navigator.of(context)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      height: 250,
                      width: 250,
                      child: Image.asset('assets/snapchat.png')),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline_sharp,
                        color: Colors.black,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    scrollPadding: EdgeInsets.only(bottom: 40.0),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                          //children: [Checkbox(value: true, onChanged: () {})],
                          ),
                    ],
                  ),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
