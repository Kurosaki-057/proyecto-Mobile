import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'cart_provider.dart';

class ConversePage extends StatefulWidget {
  const ConversePage({super.key});

  @override
  State<ConversePage> createState() => _ConversePageState();
}

class _ConversePageState extends State<ConversePage> {
  // Productos mock de Converse para demostración
  final List<Map<String, dynamic>> _converseProducts = [
    {
      'id': 'converse_run_star_trainer',
      'name': 'Converse Run star trainer navy blue',
      'price': 500000.0,
      'image': 'assets/images/consblue.jpg',
      'category': 'Sneakers',
    },
    {
      'id': 'converse_chuck_taylor',
      'name': 'Converse Chuck Taylor All Star High',
      'price': 450000.0,
      'image': 'assets/images/CONS.jpg',
      'category': 'Sneakers',
    },
    {
      'id': 'converse_chuck_70',
      'name': 'Converse Chuck 70',
      'price': 380000.0,
      'image': 'assets/images/Chuck70.jpg',
      'category': 'Sneakers',
    },
    {
      'id': 'converse_janoski',
      'name': 'Converse Janoski',
      'price': 420000.0,
      'image': 'assets/images/Janoski.jpg',
      'category': 'Sneakers',
    },
  ];

  @override
  void initState() {
    super.initState();
    // No necesitamos cargar desde el controlador, usamos productos mock
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
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand title
                    Text(
                      "Converse.",
                      style: AppTypography.titleMono.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
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
                          onTap: () => _showSortOptions(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.accentRed, width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "posicion",
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
                    ..._converseProducts.map((product) => _ProductCard(product: product)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
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
                currentValue: "posicion", // This will be updated by the controller
                onTap: () {
                  // controller.setSortBy("posicion"); // This line is removed
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Precio (menor a mayor)",
                value: "precio_asc",
                currentValue: "posicion", // This will be updated by the controller
                onTap: () {
                  // controller.setSortBy("precio_asc"); // This line is removed
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Precio (mayor a menor)",
                value: "precio_desc",
                currentValue: "posicion", // This will be updated by the controller
                onTap: () {
                  // controller.setSortBy("precio_desc"); // This line is removed
                  Navigator.pop(context);
                },
              ),
              _SortOption(
                title: "Nombre",
                value: "nombre",
                currentValue: "posicion", // This will be updated by the controller
                onTap: () {
                  // controller.setSortBy("nombre"); // This line is removed
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

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[800],
              child: (product['image'] != null && product['image'].isNotEmpty)
                  ? Image.asset(
                      product['image'],
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
          const SizedBox(height: 12),
          
          // Product name and price
          Text(
                              product['name'] ?? 'Producto sin nombre',
            style: AppTypography.bodyMono.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${(product['price'] ?? 0.0).toStringAsFixed(3)}",
                style: AppTypography.bodyMono.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add to cart button
              Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return IconButton(
                    onPressed: () {
                      final productMap = {
                        'id': product['id'] ?? 'unknown',
                        'name': product['name'] ?? 'Producto sin nombre',
                        'price': product['price'] ?? 0.0,
                        'brand': product['brand'] ?? 'Sin marca',
                        'image': product['image'] ?? '',
                        'size': product['size'] ?? 'N/A',
                        'category': product['category'] ?? 'Sin categoría',
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
