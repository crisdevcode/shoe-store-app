import 'package:flutter/material.dart';
import 'package:shoe_store/views/shared/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ProfileScreen',
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}