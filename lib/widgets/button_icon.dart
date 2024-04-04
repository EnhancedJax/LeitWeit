import 'package:flutter/material.dart';
import 'package:lietweit/main.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon; // Add a new property to store the icon

  const ButtonIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('ButtonIcon tapped');
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppTheme.secondarySurface,
          border: Border.all(color: AppTheme.border),
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        ),
        child: Icon(
          icon, // Use the provided icon
          color: AppTheme.onSurface2,
        ),
      ),
    );
  }
}
