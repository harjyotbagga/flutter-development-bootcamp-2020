import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {

  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value.toString().trim();
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                buttonTitle: 'Log In',
                onPressed: () async {
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  try {
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                buttonColor: Colors.lightBlueAccent
              )
            ],
          ),
        ),
      ),
    );
  }
}