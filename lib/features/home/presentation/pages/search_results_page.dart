import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'search_provider.dart';
import 'cart_provider.dart';
import 'converse_page.dart';
import 'ripndip_page.dart';
import 'puma_page.dart';

class SearchResultsPage extends StatelessWidget {
  final String initialQuery;
  
  const SearchResultsPage({super.key, this.initialQuery = ''});

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
            
            // Search bar
            Container(
              padding: const EdgeInsets.all(16),
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return TextField(
                    onChanged: (value) => searchProvider.updateSearchQuery(value),
                    decoration: InputDecoration(
                      hintText: "buscar marcas o productos...",
                      hintStyle: AppTypography.caption.copyWith(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black54,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    ),
                    style: AppTypography.bodyMono.copyWith(color: Colors.white),
                  );
                },
              ),
            ),
            
            // Brand filters
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: searchProvider.availableBrands.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _BrandChip(
                          label: "Todos",
                          isSelected: searchProvider.selectedBrand.isEmpty,
                          onTap: () => searchProvider.clearFilters(),
                        );
                      }
                      
                      final brand = searchProvider.availableBrands[index - 1];
                      return _BrandChip(
                        label: brand,
                        isSelected: searchProvider.selectedBrand == brand,
                        onTap: () {
                          if (brand == 'Converse') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ConversePage()),
                            );
                          } else if (brand == 'RipNdip') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const RipNdipPage()),
                            );
                          } else if (brand == 'Puma') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const PumaPage()),
                            );
                          } else {
                            searchProvider.selectBrand(brand);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
            
            // Results
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  final products = searchProvider.getFilteredProducts();
                  
                  if (products.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.white54,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "No se encontraron productos",
                            style: AppTypography.bodyMono.copyWith(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _SearchResultItem(product: product);
                    },
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

class _BrandChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _BrandChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.accentRed : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColors.accentRed : Colors.white54,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: AppTypography.bodyMono.copyWith(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final Map<String, dynamic> product;

  const _SearchResultItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accentRed.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.grey[800],
              child: product['image'] != null
                  ? Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_not_supported,
                          color: Colors.white54,
                          size: 24,
                        );
                      },
                    )
                  : const Icon(
                      Icons.shopping_bag,
                      color: Colors.white54,
                      size: 24,
                    ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: AppTypography.bodyMono.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product['brand'],
                  style: AppTypography.caption.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${(product['price'] as double).toStringAsFixed(3)}",
                  style: AppTypography.bodyMono.copyWith(
                    color: AppColors.accentRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Add to cart button
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return IconButton(
                onPressed: () {
                  cart.addItem(product);
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
                  size: 20,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
