import 'package:flutter/material.dart';
import 'package:lietweit/main.dart';
import 'package:lietweit/widgets/frame_secondary.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;

  const ButtonIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return FrameSecondary(
      child: Icon(icon, color: AppTheme.onSurface),
    );
  }
}
