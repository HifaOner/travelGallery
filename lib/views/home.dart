// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // DATA
  List travelPhotos = [
    //"assets/images/bosnia.jpg",
    "assets/images/southeastern.jpg",
    "assets/images/street_ist.jpg",
    "assets/images/mosque_ist.jpg"
  ];

  int activeIndex = 0; // SmoothIndicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(
            top: 60.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Row(
                    // ICON - HEADING
                    children: [
                      Material(
                          elevation: 1.0,
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "assets/images/user_icon.png",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(width: 100.0),
                      Center(
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              //fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // CAROUSEL SLIDER
              CarouselSlider.builder(
                  itemCount: travelPhotos.length,
                  itemBuilder: (context, index, realIndex) {
                    final res = travelPhotos[index];
                    return buildImage(res, index);
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      height: MediaQuery.of(context).size.height / 1.5,
                      //viewportFraction: 1,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      })),
              SizedBox(
                height: 20,
              ),
              Center(child: buildIndicator()),
            ],
          )),
    );
  }

  // DOTS INDUCATOR
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect: SlideEffect(
            dotWidth: 15, dotHeight: 15, activeDotColor: Colors.blue),
      );

  // PHOTO WIDGET
  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.only(left: 20),
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            )),
      );
}
