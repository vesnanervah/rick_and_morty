import 'package:flutter/material.dart';

class CharacterListItemInformationBlock extends StatelessWidget {
  final String label;
  final String value;

  const CharacterListItemInformationBlock({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.2),
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.2),
      ),
    ],
  );
}
