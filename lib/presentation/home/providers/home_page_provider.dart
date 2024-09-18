import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int get currentIndex => pageController.page?.round() ?? 0;

  final PageController pageController = PageController();

  void onTabChanged(int index) => pageController
      .animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.decelerate)
      .then((_) => notifyListeners());
}
