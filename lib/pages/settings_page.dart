import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()));
                      },
                      child: Container(
                        height: mq.height * .04,
                        width: mq.width * .09,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: mq.height * .01,
                    ),
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Container(
                height: mq.height * .01,
              ),
              Container(
                height: mq.height * .140,
                width: mq.width * .350,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.theborneopost.com/newsimages/2021/07/000_9EG69L.jpg'))),
                child: const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: mq.height * .03,
              ),
              Container(
                width: mq.width * .840,
                height: mq.height * .04,
                child: const Text(
                  'Personal Details',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                height: mq.height * .02,
              ),
              Container(
                  width: mq.width * .835,
                  height: mq.height * .12,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Container(
                            height: mq.height * .02,
                          ),
                          Container(
                            height: mq.height * .05,
                            width: mq.width * .320,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const TextField(
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: mq.height * .04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Last Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: mq.height * .02,
                          ),
                          Container(
                            height: mq.height * .05,
                            width: mq.width * .320,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const TextField(
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              Container(
                  width: mq.width * .835,
                  height: mq.height * .12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mobile Number',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        height: mq.height * .02,
                      ),
                      Container(
                        height: mq.height * .05,
                        width: mq.width * .620,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const TextField(
                          cursorColor: Colors.black,
                          cursorHeight: 20,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  )),
              Container(
                height: mq.height * .005,
              ),
              Container(
                  width: mq.width * .835,
                  height: mq.height * .12,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email Address',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              height: mq.height * .02,
                            ),
                            Container(
                              height: mq.height * .05,
                              width: mq.width * .620,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const TextField(
                                cursorColor: Colors.black,
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                height: mq.height * .005,
              ),
              Container(
                  width: mq.width * .830,
                  height: mq.height * .1,
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              height: mq.height * .05,
                              width: mq.width * .760,
                              margin: EdgeInsets.only(top: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const TextField(
                                cursorColor: Colors.black,
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                height: mq.height * .02,
              ),
              Container(
                width: mq.width * .830,
                height: mq.height * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()));
                      },
                      child: Container(
                        height: mq.height * .05,
                        width: mq.width * .350,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: mq.height * .05,
                        width: mq.width * .350,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
