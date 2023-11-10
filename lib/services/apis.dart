import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_easy/pages/main_page.dart';

class APIs {
  Future<void> register(
      String name, String email, String password, BuildContext context) async {
    final _auth = FirebaseAuth.instance;
  }
}
