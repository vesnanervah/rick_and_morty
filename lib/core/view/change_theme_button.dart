import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  final ThemeMode theme;
  final VoidCallback onTap;

  const ChangeThemeButton({
    required this.theme,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: onTap,
    child: Icon(theme == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
  );
}
