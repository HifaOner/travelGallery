import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oua_flutter_travel_gallery/components/onboarding_data.dart';
import 'package:oua_flutter_travel_gallery/views/bottom_nav.dart';
import 'package:path/path.dart' as Path;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final controller = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        body(),
        buildDots(),
        button(),
      ]),
    );
  }

  // Body
  Widget body() {
    return Expanded(
      child: Center(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Images
                      Image.asset(controller.items[currentIndex].image),
                      // Titles
                      Text(
                        controller.items[currentIndex].title,
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 48, 145, 201)),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.items[currentIndex].description,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 182, 178, 178),
                              fontFamily: "Poppins",
                              fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  // Dots
  Widget buildDots() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            controller.items.length,
            (index) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                ),
                height: 7,
                width: currentIndex == index ? 30 : 7,
                duration: const Duration(milliseconds: 700))),
      ),
    );
  }

  // Button
  Widget button() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(this.context).size.width * .9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 48, 145, 201),
      ),
      
      child: TextButton(
        onPressed: (){
          setState(() {
            if(
            currentIndex != controller.items.length -1) {currentIndex++;}
            else {
              navigateToNextScreen();
            };
          });
        },
        child: Text(currentIndex == controller.items.length - 1
            ? "Get Started"
            : "Continue",
            style: const TextStyle(color: Colors.white),),
      ),
    );
  }



  void navigateToNextScreen() {
  Navigator.push(
    this.context,
    MaterialPageRoute(
      builder: (context) => const BottomNav(),
    ),
  );
}
}
