// ignore_for_file: prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FullScreen extends StatefulWidget {
  @override
  State<FullScreen> createState() => _FullScreenState();
  String imagepath;
  FullScreen({required this.imagepath});
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
            tag: widget.imagepath,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.imagepath,
                fit: BoxFit.cover,
              ),
            )),
        Container(
            margin: EdgeInsets.only(bottom: 40),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        

                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 1.7,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(54, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ])),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Set Wallpaper",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Image will be saved in a gallery",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontFamily: "Poppins"),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
