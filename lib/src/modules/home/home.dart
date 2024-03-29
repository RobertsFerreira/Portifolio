import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/core/components/menu_indice/menu_indice_component.dart';
import 'package:portifolio/src/modules/curriculum/page/curriculum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> elevatedAnimation;
  late AnimationController elevatedAnimController;

  @override
  void initState() {
    super.initState();
    elevatedAnimController = AnimationController(
      vsync: this,
      value: 0.1,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );
    elevatedAnimation = CurvedAnimation(
      parent: elevatedAnimController,
      curve: Curves.easeInOutCubic,
      reverseCurve: Curves.easeInOutCubic,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    elevatedAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 35),
          Expanded(
            child: LayoutBuilder(
              builder: (_, constraints) {
                if (constraints.maxWidth >= 1024) {
                  return _layoutBuildDesktop(constraints.maxWidth);
                }
                if (constraints.maxWidth >= 768 &&
                    constraints.maxWidth < 1024) {
                  return _layoutBuildTablet(constraints.maxWidth);
                }
                return Text(constraints.maxWidth.toString());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _layoutBuildDesktop(double maxWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Curriculum(maxWidth: maxWidth),
        ),
        VerticalDivider(
          color: Theme.of(context).dividerColor.withOpacity(.1),
        ),
        MenuIndiceComponent(
          elevatedAnimation: elevatedAnimation,
          elevatedAnimController: elevatedAnimController,
        ),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget _layoutBuildTablet(double maxWidth) {
    return Curriculum(maxWidth: maxWidth);
  }
}
