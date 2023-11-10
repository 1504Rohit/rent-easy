import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rent_easy/pages/listing_details.dart';
import 'package:rent_easy/services/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var search = TextEditingController();

  List<Properties> properties = [];

  Future<List<Properties>> getData() async {
    final response = await http.get(
        Uri.parse('https://1504rohit.github.io/house-data/properties.json'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      for (Map<String, dynamic> i in data) {
        properties.add(Properties.fromJson(i));
      }
      return properties;
    } else {
      return properties;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: mq.width * .950,
                  height: mq.height * .075,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.location_pin,
                              color: Colors.blue,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: mq.height * .004,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Piplani,Bhopal,M.p',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: mq.height * .01,
                ),
                Container(
                  width: mq.width * .950,
                  height: mq.height * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: mq.width * .700,
                        height: mq.height * .05,
                        child: TextField(
                          controller: search,
                          cursorColor: Colors.black,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: mq.width * .08,
                        height: mq.height * .04,
                        child: Image.asset('assets/search.png'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: mq.height * .75,
                    color: Colors.grey.shade200,
                    child: FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return GridView.builder(
                              itemCount: properties.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 6,
                                      mainAxisSpacing: 6.0),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: mq.height * .80,
                                    width: mq.width * .40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .data![index].housePicture))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  snapshot.data![index].location
                                                          .city
                                                          .toString() +
                                                      "," +
                                                      snapshot.data![index]
                                                          .location.state
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "₹" +
                                                        snapshot.data![index]
                                                            .rentPrice
                                                            .toString() +
                                                        "/month",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            Text(
                                              snapshot.data![index].ratings
                                                      .toString() +
                                                  "⭐",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                            );
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
