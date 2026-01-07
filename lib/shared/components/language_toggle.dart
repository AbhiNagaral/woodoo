import 'package:flutter/material.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key,
    required this.isHindi,
    required this.onChanged,
  });

  final bool isHindi;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('EN'),
        Switch(
          value: isHindi,
          onChanged: onChanged,
        ),
        const Text('HI'),
        const SizedBox(width: 8),
      ],
    );
  }
}
