import 'package:flutter/material.dart';
import 'package:rent_easy/pages/login_page.dart';
import 'package:rent_easy/pages/ownerlogin_page.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .02,
          ),
          const Text(
            "Welcome to",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            "RentEasy",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .300,
            width: MediaQuery.of(context).size.width * .600,
            child: Image.asset("assets/welcomeLogo.png"),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Container(
              height: 58,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(11.0)),
              child: const Center(
                child: Text(
                  "Are you a user?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .02,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const OwnerLogin()));
            },
            child: Container(
              height: 58,
              width: 320,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(11.0)),
              child: const Center(
                child: Text(
                  "Are you an owner?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
