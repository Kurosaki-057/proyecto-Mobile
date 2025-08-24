import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_colors.dart';
import 'features/home/data/datasources/partner_local_data_source.dart';
import 'features/home/data/repositories/partner_repository_impl.dart';
import 'features/home/data/datasources/product_local_data_source.dart';
import 'features/home/data/repositories/product_repository_impl.dart';
import 'features/home/usecases/get_partners.dart';
import 'features/home/usecases/get_products_by_brand.dart';
import 'features/home/usecases/get_all_brands.dart';
import 'features/home/presentation/controllers/home_controller.dart';
import 'features/home/presentation/controllers/brand_controller.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/cart_provider.dart';
import 'features/home/presentation/pages/purchase_history_provider.dart';
import 'features/home/presentation/pages/search_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Inyección simple (sin paquetes de DI para mantenerlo compacto)
    final repo = PartnerRepositoryImpl(PartnerLocalDataSource());
    final getPartners = GetPartners(repo);
    
    // Product dependencies
    final productDataSource = ProductLocalDataSource();
    final productRepo = ProductRepositoryImpl(productDataSource);
    final getProductsByBrand = GetProductsByBrand(productRepo);
    final getAllBrands = GetAllBrands(productRepo);

    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
      textTheme: GoogleFonts.spaceMonoTextTheme().apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentRed,
        surface: AppColors.background,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController(getPartners)),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseHistoryProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => BrandController(
          getProductsByBrand: getProductsByBrand,
          getAllBrands: getAllBrands,
        )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SkateLand',
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}
