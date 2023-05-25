import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoe_store/providers/main_screen_provider.dart';
import 'package:shoe_store/views/shared/custom_bottom_nav.dart';
import 'package:shoe_store/views/ui/cart_screen.dart';
import 'package:shoe_store/views/ui/home_screen.dart';
import 'package:shoe_store/views/ui/profile_screen.dart';
import 'package:shoe_store/views/ui/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pageList = const [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainScreenProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenProvider.pageIndex],
          bottomNavigationBar: const CustomBottomNav(),
        );
      }
    );
  }
}


