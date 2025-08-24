import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HeaderImage extends StatelessWidget {
  final String asset;
  const HeaderImage({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          color: AppColors.card,
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
