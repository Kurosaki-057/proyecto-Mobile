import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'purchase_history_provider.dart';

class PurchaseHistoryPage extends StatelessWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: AppColors.accentRed,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Text(
                    "SKTLND®",
                    style: AppTypography.titleMono.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // Para balancear el espacio del botón
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: Consumer<PurchaseHistoryProvider>(
                builder: (context, historyProvider, child) {
                  final purchasedItems = historyProvider.getAllPurchasedItems();
                  
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          "Historial pedidos",
                          style: AppTypography.titleMono.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Articles count
                        Text(
                          "${purchasedItems.length} artículos",
                          style: AppTypography.bodyMono.copyWith(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Items list
                        if (purchasedItems.isEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                "No hay compras en el historial",
                                style: AppTypography.bodyMono.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          )
                        else
                          ...purchasedItems.map((item) => _PurchaseHistoryItem(item: item)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PurchaseHistoryItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const _PurchaseHistoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[800],
                  child: item['image'] != null
                      ? Image.asset(
                          item['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[700],
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.white54,
                                size: 32,
                              ),
                            );
                          },
                        )
                      : const Icon(
                          Icons.shopping_bag,
                          color: Colors.white54,
                          size: 32,
                        ),
                ),
              ),
              const SizedBox(width: 16),
              
              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'] ?? 'Producto',
                      style: AppTypography.bodyMono.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "talla ${item['size'] ?? 'N/A'}",
                      style: AppTypography.bodyMono.copyWith(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Total container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "total:\$${((item['price'] as double) * (item['quantity'] as int)).toStringAsFixed(3)}",
              style: AppTypography.bodyMono.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
