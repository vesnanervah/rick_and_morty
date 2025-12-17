import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/favorite_characters_page.dart';
import 'package:rick_and_morty/characters/remote_characters_page.dart';
import 'package:rick_and_morty/core/utils/nav_item.dart';
import 'package:rick_and_morty/core/view/bottom_nav_bar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late final pageViewController = PageController(
    initialPage: selectedNavItem.index,
  );
  NavItem selectedNavItem = NavItem.remoteCharacters;

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageViewController,
      children: [RemoteCharactersPage(), FavoriteCharactersPage()],
    ),
    bottomNavigationBar: BottomNavBar(
      selectedItem: selectedNavItem,
      onNavItemTap: onNavItemTap,
    ),
  );

  void onNavItemTap(int index) {
    if (index == selectedNavItem.index) return;
    setState(() {
      selectedNavItem = NavItem.values[index];
      pageViewController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn,
      );
    });
  }
}
