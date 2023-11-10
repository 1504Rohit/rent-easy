import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_easy/pages/get_started.dart';
import 'package:rent_easy/pages/login_page.dart';
import 'package:rent_easy/pages/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Container(
            width: 450,
            margin: EdgeInsets.only(top: 150),
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: AssetImage('assets/shape.png')),
            ),
          ),
          Container(
              width: 450,
              height: 219,
              color: Color.fromRGBO(0, 123, 255, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                        'https://www.theborneopost.com/newsimages/2021/07/000_9EG69L.jpg'),
                  ),
                  Container(
                    height: 70,
                    width: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Juan Dela Cruz',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '@juandelacruz',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 135, top: 300),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.edit),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 320,
            height: 350,
            color: Colors.grey.shade200,
            margin: EdgeInsets.only(top: 370, left: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    child: Row(
                      children: [
                        Image.asset('assets/bookmark.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Bookmarks',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    child: Row(
                      children: [
                        Image.asset('assets/document.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Applications',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    child: Row(
                      children: [
                        Image.asset('assets/message-question.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Help',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    child: Row(
                      children: [
                        Image.asset('assets/settings.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Settings',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _auth.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GetStarted()));
                  },
                  child: Container(
                    height: 32,
                    child: Row(
                      children: [
                        Image.asset('assets/logout.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
