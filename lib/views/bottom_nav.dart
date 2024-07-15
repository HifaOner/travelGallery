// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oua_flutter_travel_gallery/admin/add_photo.dart';
import 'package:oua_flutter_travel_gallery/admin/admin_login.dart';
import 'package:oua_flutter_travel_gallery/views/categories.dart';
import 'package:oua_flutter_travel_gallery/views/chat.dart';
import 'package:oua_flutter_travel_gallery/views/explore.dart';
import 'package:oua_flutter_travel_gallery/views/home.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late AdminLogin adminLogin;
  late AddPhoto addPhoto;
  late Home home;
  late Categories categories;
  late Explore explore;
  late Chat chat;
  late Widget currentPage;

  @override
  void initState() {
    home = Home();
    explore = Explore();
    categories = Categories();
    adminLogin = AdminLogin();
    addPhoto = AddPhoto();
    chat = Chat();
    pages = [home, explore, addPhoto, categories, chat];
    currentPage = Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 248, 246, 246),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
        ],
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 48, 145, 201), 
        unselectedItemColor: Colors.grey, 
      ),
      body: pages[currentTabIndex],
    );
  }
}
