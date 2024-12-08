import 'package:flutter/material.dart';
import 'package:food_app/pages/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BottomNav> {
  int currentTabIndex = -0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
