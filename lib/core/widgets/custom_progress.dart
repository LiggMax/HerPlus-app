import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  final double progress;
  final Color? backgroundColor;
  final Color? progressColor;
  const CustomProgress({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: 6,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: backgroundColor ?? Color(0xFF979797),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 6,
              width: constraints.maxWidth * progress,
              decoration: BoxDecoration(
                color: progressColor ?? Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        );
      },
    );
  }
}
