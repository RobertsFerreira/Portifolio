import 'package:flutter/material.dart';

class TimelineYearLeadingItem extends StatelessWidget {
  final String startYear;
  final String endYear;
  final bool isCurrent;
  const TimelineYearLeadingItem({
    super.key,
    required this.startYear,
    this.endYear = '',
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Text(startYear),
          Visibility(
            visible: !isCurrent,
            replacement: const Text('-'),
            child: const Text('a'),
          ),
          Visibility(
            visible: !isCurrent,
            replacement: const Text('Presente'),
            child: Text(endYear),
          ),
        ],
      ),
    );
  }
}
