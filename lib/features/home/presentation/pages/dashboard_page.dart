import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'categories_page.dart';
import 'all_products_page.dart';
import 'cart_page.dart';
import 'cart_provider.dart';
import 'purchase_history_page.dart';
import 'search_results_page.dart';
import 'profile_page.dart';
import 'sales_page.dart';
import 'support_page.dart';
import 'vans_page.dart';
import 'converse_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isMenuOpen = false;
  bool _isCatalogExpanded = false;
  bool _isAccountExpanded = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _toggleCatalog() {
    setState(() {
      _isCatalogExpanded = !_isCatalogExpanded;
    });
  }

  void _toggleAccount() {
    setState(() {
      _isAccountExpanded = !_isAccountExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // === MAIN CONTENT ===
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  color: AppColors.accentRed,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SKTLND®",
                          style: AppTypography.titleMono
                              .copyWith(color: Colors.white)),
                      IconButton(
                        icon: const Icon(Icons.menu,
                            color: Colors.white, size: 28),
                        onPressed: _toggleMenu,
                      ),
                    ],
                  ),
                ),

                // Body content (ejemplo: Grid de marcas)
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          children: [
                            _BrandCard(
                                image: "assets/images/RPNDP.png",
                                label: "rip n dip"),
                            _BrandCard(
                                image: "assets/images/VANS.jpeg", 
                                label: "vans",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const VansPage()),
                                  );
                                },
                            ),
                            _BrandCard(
                                image: "assets/images/CONS.jpg",
                                label: "Converse",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const ConversePage()),
                                  );
                                },
                            ),
                            _BrandCard(
                                image: "assets/images/NIKE.jpg", 
                                label: "nike"),
                          ],
                        ),
                        const SizedBox(height: 12),
                        
                        // Banner SALE con textura de ladrillo
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[800],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/REG.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black54,
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "SALE",
                              style: AppTypography.titleMono.copyWith(
                                color: AppColors.accentRed,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 12),
                        
                        // Tarjeta promocional Vans x Anderson .Paak
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Vans-X-Anderson-Paak.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.7),
                                ],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "vans x anderson. paak",
                                  style: AppTypography.bodyMono.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Center(
                          child: Text(
                            "© 2025 SkateLand®. All rights reserved.",
                            style: AppTypography.caption
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.background,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                    color: AppColors.accentRed, width: 1),
                              ),
                            ),
                            onPressed: () => Navigator.popUntil(
                                context, (route) => route.isFirst),
                            child: const Text("salir"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Overlay para cerrar menú al tocar afuera (solo área derecha)
          if (_isMenuOpen)
            Positioned(
              top: 0,
              bottom: 0,
              left: 250, // Después del ancho del menú
              right: 0,
              child: GestureDetector(
                onTap: _toggleMenu,
                child: Container(
                  color: Colors.black54,
                ),
              ),
            ),

          // === SIDE MENU (con animación) ===
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 0,
            bottom: 0,
            left: _isMenuOpen ? 0 : -250, // ancho del menú
            child: Container(
              width: 250,
              color: AppColors.accentRed,
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SearchResultsPage()),
                        );
                        _toggleMenu(); // Cierra el menú
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.white70, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              "buscar marcas...",
                              style: AppTypography.caption.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _MenuItem(icon: Icons.home, label: "Inicio", onTap: () {}),
                    
                    // Catálogo con submenú
                    _MenuItem(
                        icon: Icons.shopping_bag,
                        label: "Catálogo",
                        onTap: _toggleCatalog,
                        hasArrow: true,
                        isExpanded: _isCatalogExpanded),
                    
                    // Submenú del catálogo
                    if (_isCatalogExpanded) ...[
                      _SubMenuItem(
                          label: "Categorías",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CategoriesPage()),
                            );
                            _toggleMenu(); // Cierra el menú
                          }),
                      _SubMenuItem(
                          label: "Todo",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const AllProductsPage()),
                            );
                            _toggleMenu(); // Cierra el menú
                          }),
                    ],
                    
                    Consumer<CartProvider>(
                      builder: (context, cart, child) {
                        return _MenuItem(
                          icon: Icons.shopping_cart,
                          label: "Carrito (${cart.itemCount})",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CartPage()),
                            );
                            _toggleMenu();
                          },
                        );
                      },
                    ),
                    _MenuItem(
                        icon: Icons.local_offer,
                        label: "Sales",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SalesPage()),
                          );
                          _toggleMenu();
                        }),
                    
                    // Mi cuenta con submenú
                    _MenuItem(
                        icon: Icons.person,
                        label: "Mi cuenta",
                        onTap: _toggleAccount,
                        hasArrow: true,
                        isExpanded: _isAccountExpanded),
                    
                    // Submenú de Mi cuenta
                    if (_isAccountExpanded) ...[
                      _SubMenuItem(
                          label: "Sobre mi cuenta",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ProfilePage()),
                            );
                            _toggleMenu(); // Cierra el menú
                          }),
                      _SubMenuItem(
                          label: "Historial de compra",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const PurchaseHistoryPage()),
                            );
                            _toggleMenu(); // Cierra el menú
                          }),
                    ],
                    _MenuItem(
                        icon: Icons.phone, 
                        label: "Soporte", 
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SupportPage()),
                          );
                          _toggleMenu();
                        }),
                    const Spacer(),
                    Text("© 2025 SkateLand®. All rights reserved.",
                        style:
                            AppTypography.caption.copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandCard extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback? onTap;

  const _BrandCard({required this.image, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: AppTypography.bodyMono.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool hasArrow;
  final bool isExpanded;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.hasArrow = false,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label,
          style: AppTypography.bodyMono.copyWith(color: Colors.white)),
      trailing: hasArrow
          ? Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
            )
          : null,
      onTap: onTap,
    );
  }
}

class _SubMenuItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SubMenuItem({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: ListTile(
        title: Text(label,
            style: AppTypography.bodyMono.copyWith(
              color: Colors.white70,
              fontSize: 14,
            )),
        onTap: onTap,
      ),
    );
  }
}
