import 'package:flutter/material.dart';
import 'package:oua_flutter_travel_gallery/views/bottom_nav.dart';
import 'package:oua_flutter_travel_gallery/views/location.dart';
import 'package:oua_flutter_travel_gallery/views/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNav(),
    );
  }
}
