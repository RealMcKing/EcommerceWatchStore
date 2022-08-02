import 'package:flutter/material.dart';

import 'package:ecommerce_watch_store/theme/colors.dart';

class LinearTabIndicator extends Decoration {
  final Color color;

  const LinearTabIndicator({required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LinearPainted(color: color);
  }
}

class _LinearPainted extends BoxPainter {
  final Color color;

  _LinearPainted({required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = AppColors.kPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Offset startOffset = Offset(0, configuration.size!.height);

    final Offset finishOffset =
    Offset(configuration.size!.width / 3, configuration.size!.height);

    canvas.drawLine(startOffset + offset, finishOffset + offset, paint);
  }
}