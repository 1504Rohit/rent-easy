import 'package:flutter/material.dart';

class ListingDetails extends StatefulWidget {
  const ListingDetails({super.key});

  @override
  State<ListingDetails> createState() => _ListingDetailsState();
}

class _ListingDetailsState extends State<ListingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Text('Listing page'),
       ),
    );
  }
}
