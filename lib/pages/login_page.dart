import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_easy/pages/forgetpassword_page.dart';
import 'package:rent_easy/pages/main_page.dart';
import 'package:rent_easy/pages/phone_auth_page.dart';
import 'package:rent_easy/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Container(
              width: 310,
              height: 187,
              child: Image.asset("assets/login.png"),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .04,
            ),
            const Text(
              "login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .06,
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          labelText: 'Email',
                          hintText: 'Enter your email'),
                      validator: (value) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString())) {
                          return 'Please enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .06,
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter your password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassword()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      "Create Account?",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .02,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  _auth
                      .signInWithEmailAndPassword(
                          email: email.text.toString(),
                          password: password.text.toString())
                      .then((value) {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  }).onError((error, stackTrace) {
                    setState(() {
                      isLoading = false;
                    });
                    Fluttertoast.showToast(
                        msg: error.toString().substring(
                            error.toString().indexOf(']') + 1,
                            error.toString().length),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                }
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue,
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Center(
                          child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .03,
            ),
            const Text(
              "Or SignUp With",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .04,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .06,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
