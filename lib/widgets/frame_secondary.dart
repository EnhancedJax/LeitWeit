import 'package:flutter/material.dart';
import 'package:LeitWeit/main.dart';

class FrameSecondary extends StatefulWidget {
  final Widget child;

  const FrameSecondary({super.key, required this.child});

  @override
  _FrameSecondaryState createState() => _FrameSecondaryState();
}

class _FrameSecondaryState extends State<FrameSecondary> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isPressed
              ? AppTheme.secondarySurface.withAlpha(30)
              : AppTheme.secondarySurface,
          border: Border.all(color: AppTheme.border),
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        ),
        child: widget.child,
      ),
    );
  }
}
