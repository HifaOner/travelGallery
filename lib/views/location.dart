import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oua_flutter_travel_gallery/components/colors.dart';

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

  // 41.0052036,28.8470311

  var firstLocation =
      const CameraPosition(target: LatLng(41.0052036, 28.8470311), zoom: 9);

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
      markerId: const MarkerId("id"),
      position: LatLng(lat, long),
      infoWindow: const InfoWindow(title: "Location", snippet: ""),
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
                      child: GestureDetector(
                        onTap: () {
                          goLocation();
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(54, 255, 255, 255),
                                Color.fromARGB(146, 223, 215, 215)
                              ])),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "See Current Location",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.primaryColor,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
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
