import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/core/components/menu_indice/menu_indice_item.dart';

class MenuIndiceComponent extends StatelessWidget {
  final Animation<double> elevatedAnimation;
  final AnimationController elevatedAnimController;
  final List<MenuIndiceItem> items;

  const MenuIndiceComponent({
    super.key,
    required this.elevatedAnimation,
    required this.elevatedAnimController,
    required this.items,
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => items[index],
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemCount: items.length,
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
