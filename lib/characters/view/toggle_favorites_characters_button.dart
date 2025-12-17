import 'package:flutter/material.dart';

class ToggleFavoritesCharactersButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const ToggleFavoritesCharactersButton({
    required this.isFavorite,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: onTap,
    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
  );
}
