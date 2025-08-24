import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class CtaButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CtaButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentRed,
          foregroundColor: AppColors.textPrimary,
          shape: const StadiumBorder(),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Text('iniciar sesión', style: AppTypography.button),
      ),
    );
  }
}
