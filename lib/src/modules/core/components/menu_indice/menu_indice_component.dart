import 'package:flutter/material.dart';

import 'menu_indice_item.dart';

class MenuIndiceComponent extends StatelessWidget {
  final Animation<double> elevatedAnimation;
  final AnimationController elevatedAnimController;

  const MenuIndiceComponent({
    super.key,
    required this.elevatedAnimation,
    required this.elevatedAnimController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: MouseRegion(
        onHover: (_) => elevatedAnimController.forward(from: 10),
        onExit: (_) => elevatedAnimController.reverse(from: 1),
        child: Card(
          elevation: elevated,
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuIndiceItem(title: 'Home'),
                SizedBox(height: 10),
                MenuIndiceItem(title: 'Projects'),
                SizedBox(height: 10),
                MenuIndiceItem(title: 'CV'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double get elevated {
    return elevatedAnimation.value < 1 ? 1 : elevatedAnimation.value * 10;
  }
}
