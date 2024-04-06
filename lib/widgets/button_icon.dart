import 'package:flutter/material.dart';
import 'package:LeitWeit/themedata.dart';
import 'package:LeitWeit/widgets/frame_secondary.dart';

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
