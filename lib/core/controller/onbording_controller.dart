import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  final PageController pageController = PageController();

  final List<Map<String, String>> pages = [
    {
      "title": "Fastest Payment in the world",
      "subtitle":
          "Integrate multiple payment methods to help you up the process quickly",
      "image": "assets/images/onboarding_1.png",
    },
    {
      "title": "The most Secoure Platfrom for Customer",
      "subtitle":
          "Built-in Fingerprint, face recognition and more, keeping you completely safe.",
      "image": "assets/images/onboarding_2.png",
    },
    {
      "title": "Paying for Everything is Easy and Convenient",
      "subtitle":
          "Built-in Fingerprint, face recognition and more, keeping you completely safet.",
      "image": "assets/images/onboarding_3.png",
    },
  ];

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  void next() {
    if (currentIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed('/signin');
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
