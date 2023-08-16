import 'package:bloc_clean_code/core/widgets/app_background.dart';
import 'package:bloc_clean_code/core/widgets/bottom_nav.dart';

import 'package:bloc_clean_code/feature/feature_weather/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/feature_bookmark/presentation/screens/bookmark_screen/bookmark_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      const HomeScreen(),
      BookmarkScreen(pageController: pageController),
    ];
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      // bottomNavigationBar: BottomNav(controller: pageController),
      body: Container(
        height: height ,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AppBackground.getBackGroundImage(), fit: BoxFit.cover)),
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}