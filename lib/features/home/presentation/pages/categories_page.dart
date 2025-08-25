import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === HEADER ===
            Container(
              color: AppColors.accentRed,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pop(context); // vuelve al Dashboard
                    },
                  ),
                  Text(
                    "SKTLND®",
                    style:
                        AppTypography.titleMono.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: Text("Categorías",
                  style: AppTypography.titleMono.copyWith(fontSize: 22)),
            ),
            const SizedBox(height: 20),

            // === Sneakers ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/shoesBPC.jpg",
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("Sneakers",
                      style: AppTypography.bodyMono
                          .copyWith(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // === T-shirts ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("T-shirts",
                      style: AppTypography.bodyMono
                          .copyWith(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // === Skateboards ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Skateboards",
                      style: AppTypography.bodyMono
                          .copyWith(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),

            const Spacer(),

            // === Collabs Section ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Logo verde de collabs
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "collabs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Caja gris con texto
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Colaboraciones y ediciones especiales entre marcas especializadas en skateboarding con grandes iconos del mundo skate.",
                        style: AppTypography.caption.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: Text("© 2025 SkateLand®. All rights reserved.",
                  style: AppTypography.caption.copyWith(color: Colors.white)),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
