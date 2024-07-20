import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Completer<GoogleMapController> mapController = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goLocation();
  }

  double lat = 0.0;
  double long = 0.0;

  // 39.9032594,32.5976162,11z

  var firstLocation =
      const CameraPosition(target: LatLng(39.9032594, 32.5976162), zoom: 11);

  List<Marker> markers = <Marker>[];

  Future<void> goLocation() async {
    GoogleMapController controller = await mapController.future;
    LocationPermission permission = await Geolocator.requestPermission();

    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = currentLocation.latitude;
      long = currentLocation.longitude;
      //firstLocation = CameraPosition(target: LatLng(lat, long),zoom: 8);
    });

    var lastLocation = CameraPosition(target: LatLng(lat, long), zoom: 9);

    var locationMarker = Marker(
      markerId: MarkerId("id"),
      position: LatLng(lat, long),
      infoWindow: InfoWindow(title: "Location", snippet: ""),
    );

    setState(() {
      markers.add(locationMarker);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(lastLocation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GoogleMap(
                      initialCameraPosition: firstLocation,
                      mapType: MapType.normal,
                      markers: Set<Marker>.of(markers),
                      onMapCreated: (GoogleMapController controller) {
                        mapController.complete(controller);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 650),
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(this.context).size.width * .5,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 48, 145, 201),
                        ),
                        child: TextButton(
                          onPressed: () {
                            goLocation();
                          },
                          child: const Text(
                            "See Current Location",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
