import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rent_easy/services/apis.dart';

import 'login_page.dart';
import 'main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool value = false;
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController password2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .620,
              height: MediaQuery.of(context).size.height * .187,
              child: Image.asset("assets/login.png"),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .04,
            ),
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .06,
                    child: TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
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
                          labelText: 'Name',
                          hintText: 'Enter your name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
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
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .06,
                    child: TextFormField(
                      obscureText: true,
                      controller: password,
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
                          hintText: 'Enter password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .04,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: this.value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * .286,
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'By registering, you are agreeing with our',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: ' Terms of use',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ])),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .664,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
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
                      .createUserWithEmailAndPassword(
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
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Center(
                          child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
            ),
          ],
        ),
      ),
    );
  }
}
