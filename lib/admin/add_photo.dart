// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oua_flutter_travel_gallery/components/colors.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final List<String> categoryitems = [
    "Anatolia",
    "Black Sea",
    "The Marmara",
    "Eastern",
    "Aegean",
    "Mediterranean",
    "Southeastern"
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new_outlined),
                  SizedBox(width: 90),
                  Center(
                    child: Text(
                      "Add Photo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5,color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20.0),
                    
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                items: categoryitems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal),
                          ),
                        ))
                    .toList(),
                onChanged: ((value) => setState(() {
                      this.value = value;
                    })),
                hint: Text(
                  "Select Category",
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.w500),
                ),
                value: value,
              )),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {},
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 48, 145, 201))),
                      onPressed: () {},
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
