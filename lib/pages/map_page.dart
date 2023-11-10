import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var coordinates = TextEditingController();
  double longitude = 77.4126;
  double latitude = 23.2599;
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.2599, 77.4126),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Expanded(
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60, left: 40),
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 300,
                child: TextField(
                  controller: coordinates,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                ),
              ),
              InkWell(
                onTap: ()async {
                List<Location> locations =
                    await locationFromAddress(coordinates.toString());
                     GoogleMapController controller = await _controller.future;
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: LatLng(latitude, longitude), zoom: 14.4746,),
                  ));
                   latitude = locations.reversed.last.latitude.toDouble();
      
                  longitude = locations.reversed.last.longitude.toDouble();
                setState((){
                 
                });
              },
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 10),
                  width: 40,
                  child: Image.asset('assets/mapfilter.png'),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
