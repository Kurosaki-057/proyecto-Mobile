import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/brand_controller.dart';
import '../../domain/entities/product.dart';
import 'cart_provider.dart';

class VansPage extends StatefulWidget {
  const VansPage({super.key});

  @override
  State<VansPage> createState() => _VansPageState();
}

class _VansPageState extends State<VansPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandController>().loadProductsByBrand('Vans');
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
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
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
                              controller.loadProductsByBrand('Vans');
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
                        // Brand title
                        Text(
                          "Vans.",
                          style: AppTypography.titleMono.copyWith(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Brand header image
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/VANS.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                "No hay productos Vans disponibles",
                                style: AppTypography.bodyMono.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          )
                        else
                          ...controller.products.map((product) => _ProductCard(product: product)),
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
                currentValue: "posicion",
                onTap: () {
                  // No action needed, already selected
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Precio (menor a mayor)",
                value: "precio_asc",
                currentValue: "posicion",
                onTap: () {
                  // No action needed, already selected
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Precio (mayor a menor)",
                value: "precio_desc",
                currentValue: "posicion",
                onTap: () {
                  // No action needed, already selected
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Nombre",
                value: "nombre",
                currentValue: "posicion",
                onTap: () {
                  // No action needed, already selected
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
    return ListTile(
      title: Text(
        title,
        style: AppTypography.bodyMono.copyWith(
          color: currentValue == value ? AppColors.accentRed : Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accentRed.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: product.image.isNotEmpty
                  ? Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.white54,
                            size: 40,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white54,
                        size: 48,
                      ),
                    ),
            ),
          ),
          
          // Product info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTypography.bodyMono.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${product.price.toStringAsFixed(3)}",
                  style: AppTypography.bodyMono.copyWith(
                    color: AppColors.accentRed,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Add to cart button
                SizedBox(
                  width: double.infinity,
                  child: Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      return ElevatedButton(
                        onPressed: () {
                          final productMap = {
                            'id': product.id,
                            'name': product.name,
                            'price': product.price,
                            'brand': product.brand,
                            'image': product.image,
                            'size': product.size,
                            'category': product.category,
                          };
                          cart.addItem(productMap);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Agregado al carrito",
                                style: AppTypography.bodyMono,
                              ),
                              backgroundColor: AppColors.accentRed,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Agregar al carrito",
                          style: AppTypography.bodyMono.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
