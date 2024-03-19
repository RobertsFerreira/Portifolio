import 'package:flutter/material.dart';

class MenuIndiceItem extends StatelessWidget {
  final String title;
  const MenuIndiceItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        TextButton.icon(
          onPressed: () => debugPrint('title: $title'),
          icon: const Icon(Icons.circle, size: 10),
          label: Text(title),
        ),
      ],
    );
  }
}
