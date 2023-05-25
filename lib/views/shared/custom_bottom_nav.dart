import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/providers/main_screen_provider.dart';
import 'package:shoe_store/views/shared/bottom_nav_widget.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainScreenProvider, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavWidget(
                    onTap: () {
                      mainScreenProvider.pageIndex = 0;
                    },
                    icon: mainScreenProvider.pageIndex == 0
                        ? CommunityMaterialIcons.home
                        : CommunityMaterialIcons.home_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreenProvider.pageIndex = 1;
                    },
                    icon: mainScreenProvider.pageIndex == 1
                        ? Ionicons.search
                        : Ionicons.search_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreenProvider.pageIndex = 2;
                    },
                    icon: mainScreenProvider.pageIndex == 2
                        ? Ionicons.add
                        : Ionicons.add_circle_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreenProvider.pageIndex = 3;
                    },
                    icon: mainScreenProvider.pageIndex == 3
                        ? Ionicons.cart
                        : Ionicons.cart_outline,
                  ),
                  BottomNavWidget(
                      onTap: () {
                        mainScreenProvider.pageIndex = 4;
                      },
                      icon: mainScreenProvider.pageIndex == 4
                          ? Ionicons.person
                          : Ionicons.person_outline),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
