import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String description;
  const TimelineItem({
    super.key,
    required this.title,
    this.subTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Visibility(
          visible: subTitle != null,
          replacement: const SizedBox.shrink(),
          child: Text(subTitle ?? ''),
        ),
        Text(description),
      ],
    );
  }
}
