import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'cart_provider.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  // Lista de productos mock para demostración
  final List<Map<String, dynamic>> _products = [
    {
      'id': '1',
      'name': 'Nike Air Force 1',
      'price': 120.0,
      'image': 'assets/images/NIKE.jpg',
      'category': 'Sneakers'
    },
    {
      'id': '2',
      'name': 'Vans Old Skool',
      'price': 85.0,
      'image': 'assets/images/VANS.jpeg',
      'category': 'Sneakers'
    },
    {
      'id': '3',
      'name': 'Converse Chuck Taylor',
      'price': 65.0,
      'image': 'assets/images/CONS.jpg',
      'category': 'Sneakers'
    },
    {
      'id': '4',
      'name': 'RipNDip T-Shirt',
      'price': 35.0,
      'image': 'assets/images/RPNDP.png',
      'category': 'T-Shirts'
    },
    {
      'id': '5',
      'name': 'Element Skateboard',
      'price': 150.0,
      'image': 'assets/images/sbdunk88.jpeg',
      'category': 'Skateboards'
    },
    {
      'id': '6',
      'name': 'Puma RS-X',
      'price': 95.0,
      'image': 'assets/images/PUMARPNDP.jpg',
      'category': 'Sneakers'
    },
    {
      'id': '7',
      'name': 'Vans x Anderson Paak',
      'price': 110.0,
      'image': 'assets/images/Vans-X-Anderson-Paak.jpg',
      'category': 'Sneakers'
    },
    {
      'id': '8',
      'name': 'Nike SB Dunk',
      'price': 140.0,
      'image': 'assets/images/sbdunk88.jpeg',
      'category': 'Sneakers'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "todo en sktlnd®",
          style: AppTypography.titleMono.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.accentRed,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return _AnimatedProductCard(
            product: product,
            onAddToCart: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${product['name']} agregado al carrito",
                    style: AppTypography.bodyMono,
                  ),
                  backgroundColor: AppColors.accentRed,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _AnimatedProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onAddToCart;

  const _AnimatedProductCard({
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product['id'],
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              // ignore: deprecated_member_use
              color: AppColors.accentRed.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    width: double.infinity,
                    // ignore: deprecated_member_use
                    color: AppColors.accentRed.withOpacity(0.1),
                    child: Image.asset(
                      product['image'] ?? 'assets/images/CONS.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          // ignore: deprecated_member_use
                          color: AppColors.accentRed.withOpacity(0.2),
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppColors.textSecondary,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['name'] ?? 'Sin nombre',
                        style: AppTypography.bodyMono.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['category'] ?? 'Sin categoría',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${((product['price'] as double?) ?? 0.0).toStringAsFixed(0)}",
                                style: AppTypography.bodyMono.copyWith(
                                  color: AppColors.accentRed,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          // Botón agregar al carrito
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppColors.accentRed,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: onAddToCart,
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
