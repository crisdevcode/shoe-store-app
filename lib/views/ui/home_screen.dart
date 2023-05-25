import 'package:flutter/material.dart';
import 'package:shoe_store/views/shared/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HomeScreen',
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}