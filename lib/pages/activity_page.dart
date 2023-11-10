import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20),
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Material(
                    child: Container(
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      child: TabBar(
                        physics: ClampingScrollPhysics(),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent),
                        tabs: [
                          Tab(
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Messages',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text('Notifications',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                      child: TabBarView(
                    children: [
                      Center(
                        child: Text("Message Page"),
                      ),
                      Center(
                        child: Text("Notification Page"),
                      )
                    ],
                  ))
                ],
              )),
        ));
  }
}
