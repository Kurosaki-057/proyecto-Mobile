import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/brand_controller.dart';
import '../../domain/entities/product.dart';
import 'cart_provider.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandController>().loadProductsByBrand('Puma');
    });
  }

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
                  const SizedBox(width: 48),
                ],
              ),
            ),
            
            // Sale Banner
            Container(
              width: double.infinity,
              color: AppColors.accentRed,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    "SALE",
                    style: AppTypography.titleMono.copyWith(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "SKATE & SNEAKERS",
                    style: AppTypography.bodyMono.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            
            // Main Sale Image
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/NIKEantihero.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.accentRed,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "HOT SALE",
                            style: AppTypography.bodyMono.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Nike SB Collection",
                          style: AppTypography.titleMono.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Hasta 50% OFF",
                          style: AppTypography.bodyMono.copyWith(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Content
            Expanded(
              child: Consumer<BrandController>(
                builder: (context, controller, child) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.accentRed,
                      ),
                    );
                  }

                  if (controller.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Error: ${controller.error}',
                            style: AppTypography.bodyMono.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              controller.clearError();
                              controller.loadProductsByBrand('Puma');
                            },
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Repeating SALE text
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "SALE SALE SALE SALE",
                            style: AppTypography.titleMono.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        
                        // Sale images grid
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/SALE.jpeg',
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/SALE2.png',
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/consblue.jpg',
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/Oldsk.jpg',
                                fit: BoxFit.cover,
                                height: 120,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        
                        // Filter button
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.accentRed,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "filtrar por",
                            style: AppTypography.bodyMono.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Sort by dropdown
                        Row(
                          children: [
                            Text(
                              "ordenar por:",
                              style: AppTypography.bodyMono.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => _showSortOptions(context, controller),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      controller.sortBy,
                                      style: AppTypography.bodyMono.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.keyboard_arrow_up,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        // Products grid
                        if (controller.products.isEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Text(
                                "No hay productos en oferta disponibles",
                                style: AppTypography.bodyMono.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          )
                        else
                          ...controller.products.map((product) => _SaleProductCard(product: product)),
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

  void _showSortOptions(BuildContext context, BrandController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ordenar por:",
                style: AppTypography.titleMono.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              _SortOption(
                title: "Posición",
                value: "posicion",
                currentValue: controller.sortBy,
                onTap: () {
                  controller.setSortBy("posicion");
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Precio (menor a mayor)",
                value: "precio_asc",
                currentValue: controller.sortBy,
                onTap: () {
                  controller.setSortBy("precio_asc");
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Precio (mayor a menor)",
                value: "precio_desc",
                currentValue: controller.sortBy,
                onTap: () {
                  controller.setSortBy("precio_desc");
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Descuento",
                value: "descuento",
                currentValue: controller.sortBy,
                onTap: () {
                  controller.setSortBy("descuento");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SortOption extends StatelessWidget {
  final String title;
  final String value;
  final String currentValue;
  final VoidCallback onTap;

  const _SortOption({
    required this.title,
    required this.value,
    required this.currentValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == currentValue;
    
    return ListTile(
      title: Text(
        title,
        style: AppTypography.bodyMono.copyWith(
          color: isSelected ? AppColors.accentRed : Colors.white,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.accentRed)
          : null,
      onTap: onTap,
    );
  }
}

class _SaleProductCard extends StatelessWidget {
  final Product product;

  const _SaleProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    // Calculate sale price (30% off)
    final originalPrice = product.price;
    final salePrice = originalPrice * 0.7;
    final discount = ((originalPrice - salePrice) / originalPrice * 100).round();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with sale badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[800],
                  child: product.image.isNotEmpty
                      ? Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[700],
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.white54,
                                size: 48,
                              ),
                            );
                          },
                        )
                      : const Icon(
                          Icons.shopping_bag,
                          color: Colors.white54,
                          size: 48,
                        ),
                ),
              ),
              // Sale badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.accentRed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "-$discount%",
                    style: AppTypography.bodyMono.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Product name
          Text(
            product.name,
            style: AppTypography.bodyMono.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          
          // Price section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Original price (crossed out)
                  Text(
                    "\$${originalPrice.toStringAsFixed(3)}",
                    style: AppTypography.bodyMono.copyWith(
                      color: Colors.white54,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  // Sale price
                  Text(
                    "\$${salePrice.toStringAsFixed(3)}",
                    style: AppTypography.bodyMono.copyWith(
                      color: AppColors.accentRed,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Add to cart button
              Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return IconButton(
                    onPressed: () {
                      final productMap = {
                        'id': product.id,
                        'name': product.name,
                        'price': salePrice, // Use sale price
                        'originalPrice': originalPrice,
                        'brand': product.brand,
                        'image': product.image,
                        'size': product.size,
                        'category': product.category,
                        'isOnSale': true,
                        'discount': discount,
                      };
                      cart.addItem(productMap);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Agregado al carrito con $discount% de descuento",
                            style: AppTypography.bodyMono,
                          ),
                          backgroundColor: AppColors.accentRed,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
