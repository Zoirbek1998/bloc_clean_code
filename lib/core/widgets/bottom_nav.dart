import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final PageController controller;

  const BottomNav({super.key, required this.controller});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme
        .of(context)
        .primaryColor;
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return BottomAppBar(
      notchMargin: 5,
      color: primaryColor,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {

              widget.controller.animateToPage(
                  0, duration: const Duration(milliseconds: 300), curve:Curves.easeInOut);

            }, icon:  Icon(Icons.home)),
            const SizedBox(),
            IconButton(onPressed: () {
              widget.controller.animateToPage(
                  1, duration: const Duration(milliseconds: 300), curve:Curves.easeInOut);
            }, icon: const Icon(Icons.bookmark)),
          ],
        ),
      ),
    );
  }
}
