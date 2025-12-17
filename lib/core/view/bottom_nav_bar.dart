import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/nav_item.dart';

class BottomNavBar extends StatelessWidget {
  final NavItem selectedItem;
  final void Function(int index) onNavItemTap;
  const BottomNavBar({
    required this.selectedItem,
    required this.onNavItemTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    onTap: onNavItemTap,
    currentIndex: selectedItem.index,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.list), label: "All"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
    ],
  );
}
