import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/core/components/menu_indice/menu_indice_component.dart';
import 'package:portifolio/src/modules/curriculum/page/curriculum.dart';

import '../core/components/menu_indice/menu_indice_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> elevatedAnimation;
  late AnimationController elevatedAnimController;

  final curriculumKey = GlobalKey(debugLabel: 'curriculum_section');
  final homeKey = GlobalKey(debugLabel: 'home_section');
  bool inAnimation = false;

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

  void gotoSection(GlobalKey? key) {
    if (key != null) {
      setState(() {
        inAnimation = true;
      });
      log('goto section: $key');
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Durations.extralong4,
        curve: Easing.standardDecelerate,
      ).then(
        (_) => setState(() {
          inAnimation = false;
        }),
      );
    }
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
          flex: 7,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(key: homeKey, height: 1500),
                Curriculum(key: curriculumKey, maxWidth: maxWidth),
              ],
            ),
          ),
        ),
        VerticalDivider(
          color: Theme.of(context).dividerColor.withOpacity(.1),
        ),
        MenuIndiceComponent(
          elevatedAnimation: elevatedAnimation,
          elevatedAnimController: elevatedAnimController,
          items: [
            MenuIndiceItem(
              title: 'Home',
              onPressed: inAnimation ? null : () => gotoSection(homeKey),
            ),
            const MenuIndiceItem(title: 'Projects'),
            MenuIndiceItem(
              title: 'CV',
              onPressed: inAnimation ? null : () => gotoSection(curriculumKey),
            ),
          ],
        ),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget _layoutBuildTablet(double maxWidth) {
    return Curriculum(key: curriculumKey, maxWidth: maxWidth);
  }
}
