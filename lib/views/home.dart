// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oua_flutter_travel_gallery/components/colors.dart';
import 'package:oua_flutter_travel_gallery/views/explore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // DATA
  List travelPhotos = [
    "assets/images/bosnia.jpg",
    "assets/images/southeastern.jpg",
    //"assets/images/street_ist.jpg",
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
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  // ICON - HEADING
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.menu,
                      size: 28,
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 63, 62, 62),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Explore()));
                    },
                    child: Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_outlined,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),

              // Blue Box
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor.withOpacity(1),
                          AppColors.primaryColor.withOpacity(1),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 10),
                          blurRadius: 20,
                          color: AppColors.primaryColor.withOpacity(0.2),
                        ),
                      ]),
                  // Container Text
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start a Chat with AI and",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Say Where You Want to Go",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "5 Question for Free",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      //autoPlay: true,
                      height: MediaQuery.of(context).size.height / 1.9,
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
