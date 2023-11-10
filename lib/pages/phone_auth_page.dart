import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_easy/firebase_options.dart';

import 'otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: const Center(
                child: Text(
                  'Phone Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 20, left: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Phone Number with country code',
                    prefix: const Padding(
                      padding: EdgeInsets.all(4),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                maxLength: 15,
                controller: _controller,
              ),
            )
          ]),
          Container(
            margin: EdgeInsets.only(top: 40, right: 20, left: 20),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                _auth.verifyPhoneNumber(
                    phoneNumber: _controller.text,
                    verificationCompleted: (_) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        isLoading = false;
                      });
                      Fluttertoast.showToast(
                          msg: e.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    codeSent: (String verification, int? token) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTPScreen(verification)));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      setState(() {
                        isLoading = false;
                      });
                      Fluttertoast.showToast(
                          msg: e.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
              },
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
