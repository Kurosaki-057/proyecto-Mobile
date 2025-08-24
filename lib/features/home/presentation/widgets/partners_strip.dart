import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/partner.dart';

class PartnersStrip extends StatelessWidget {
  final List<Partner> partners;
  const PartnersStrip({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('partners', style: AppTypography.caption),
        const SizedBox(height: 10),
        Wrap(
          spacing: 18,
          runSpacing: 14,
          children: partners.map((p) {
            return Opacity(
              opacity: .95,
              child: Image.asset(
                p.assetPath,
                width: 96,
                height: 40,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  // Por si todavía no tienes el logo, mostramos un rectángulo con el nombre
                  return Container(
                    width: 96,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(p.name, style: AppTypography.caption),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
