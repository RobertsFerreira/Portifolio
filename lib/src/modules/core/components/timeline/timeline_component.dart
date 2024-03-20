import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
    required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.indicatorAlignment = Alignment.center,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
    this.indicatorGapFactory = 1.5,
    this.indicatorCentered = false,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length),
        super(key: key);

  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget>? indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController? controller;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;
  final double indicatorGapFactory;
  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final Alignment indicatorAlignment;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  ///Center the index finger, wrapping it in a
  ///sizedbox on accord size of it
  final bool indicatorCentered;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];

        Widget? indicator;
        if (indicators != null) {
          indicator = indicators![index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              indicatorAlignment: indicatorAlignment,
              indicatorGapFactory: indicatorGapFactory,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: Align(
                alignment: indicatorAlignment,
                child: indicatorCentered
                    ? SizedBox(
                        height: indicatorSize,
                        width: indicatorSize,
                        child: Center(child: indicator),
                      )
                    : indicator,
              ),
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.hideDefaultIndicator,
    required this.indicatorColor,
    required this.indicatorStyle,
    required this.indicatorSize,
    required this.indicatorAlignment,
    required this.indicatorGapFactory,
    required this.lineGap,
    required this.strokeCap,
    required this.strokeWidth,
    required this.style,
    required this.lineColor,
    required this.isFirst,
    required this.isLast,
    required this.itemGap,
  })  : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final Alignment indicatorAlignment;
  final double indicatorGapFactory;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    ///calcule the radius of the indicator based on the size
    final indicatorRadius = indicatorSize / 2;

    ///calcule the gap between the final of the text and the next topic on the timeline
    final halfItemGap = itemGap / 2;

    /// calc the gap between the indicator and the line
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(
      Offset(indicatorRadius, 0.0 - halfItemGap),
    );

    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(
      Offset(indicatorRadius, 0.0 + halfItemGap),
    );

    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    final topLeft = size.topLeft(
      Offset(indicatorRadius, indicatorMargin * indicatorGapFactory),
    );

    if (!isLast && indicatorAlignment == Alignment.topCenter) {
      canvas.drawLine(topLeft, bottom, linePaint);
    } else if (!isFirst && !isLast) {
      canvas.drawLine(top, centerTop, linePaint);
    }

    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (isLast) {
      canvas.drawLine(topLeft, centerBottom, linePaint);

      /// Draw the line of the last item where the size of
      /// the item is based on the size of the child on the right
      final bottomLast = size.bottomLeft(Offset(indicatorRadius, 0));

      canvas.drawLine(centerBottom, bottomLast, linePaint);
    }

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.topLeft(
        Offset(indicatorRadius, halfItemGap),
      );

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
