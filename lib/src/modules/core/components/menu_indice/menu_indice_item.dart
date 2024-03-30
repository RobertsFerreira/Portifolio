import 'package:flutter/material.dart';

class MenuIndiceItem extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const MenuIndiceItem({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        TextButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.circle, size: 10),
          label: Text(title),
        ),
      ],
    );
  }
}
