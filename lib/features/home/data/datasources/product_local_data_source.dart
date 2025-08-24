import '../models/product_model.dart';
import '../models/brand_model.dart';

class ProductLocalDataSource {
  // Datos simulados de productos
  static final List<ProductModel> _products = [
    // Converse products
    ProductModel(
      id: 'conv_1',
      name: 'Converse Chuck Taylor All Star',
      price: 80000,
      brand: 'Converse',
      image: 'assets/images/converse_chuck_taylor.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'conv_2',
      name: 'Converse One Star',
      price: 90000,
      brand: 'Converse',
      image: 'assets/images/converse_one_star.jpg',
      size: '41',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'conv_3',
      name: 'Converse Run Star Hike',
      price: 120000,
      brand: 'Converse',
      image: 'assets/images/converse_run_star.jpg',
      size: '43',
      category: 'Sneakers',
    ),
    // RipNdip products
    ProductModel(
      id: 'rip_1',
      name: 'RipNdip Skate Deck Classic',
      price: 150000,
      brand: 'RipNdip',
      image: 'assets/images/ripndip_deck_classic.jpg',
      size: '8.0',
      category: 'Skate',
    ),
    ProductModel(
      id: 'rip_2',
      name: 'RipNdip Cat Hoodie',
      price: 200000,
      brand: 'RipNdip',
      image: 'assets/images/ripndip_hoodie.jpg',
      size: 'M',
      category: 'Clothing',
    ),
    ProductModel(
      id: 'rip_3',
      name: 'RipNdip Wheels Set',
      price: 80000,
      brand: 'RipNdip',
      image: 'assets/images/ripndip_wheels.jpg',
      size: '52mm',
      category: 'Skate',
    ),
    // Puma products for sales
    ProductModel(
      id: 'puma_1',
      name: 'Puma Suede Classic',
      price: 180000,
      brand: 'Puma',
      image: 'assets/images/puma_suede_classic.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'puma_2',
      name: 'Puma RS-X Reinvention',
      price: 250000,
      brand: 'Puma',
      image: 'assets/images/puma_rsx.jpg',
      size: '41',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'puma_3',
      name: 'Puma Cali Sport',
      price: 220000,
      brand: 'Puma',
      image: 'assets/images/puma_cali.jpg',
      size: '40',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'puma_4',
      name: 'Puma Future Rider',
      price: 190000,
      brand: 'Puma',
      image: 'assets/images/puma_future_rider.jpg',
      size: '43',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'puma_5',
      name: 'Puma Clyde Court',
      price: 280000,
      brand: 'Puma',
      image: 'assets/images/puma_clyde.jpg',
      size: '42',
      category: 'Basketball',
    ),
    ProductModel(
      id: 'puma_6',
      name: 'Puma Thunder Spectra',
      price: 300000,
      brand: 'Puma',
      image: 'assets/images/puma_thunder.jpg',
      size: '44',
      category: 'Sneakers',
    ),
  ];

  // Datos simulados de marcas
  final List<BrandModel> _brands = [
    const BrandModel(
      id: 'nike',
      name: 'Nike',
      displayName: 'Nike.',
      description: 'Just Do It',
      logoImage: 'assets/images/nike_logo.png',
    ),
    const BrandModel(
      id: 'converse',
      name: 'Converse',
      displayName: 'Converse',
      description: 'All Star',
      logoImage: 'assets/images/converse_logo.png',
    ),
    const BrandModel(
      id: 'ripndip',
      name: 'RipNdip',
      displayName: 'RipNdip',
      description: 'Skate Culture',
      logoImage: 'assets/images/ripndip_logo.png',
    ),
    const BrandModel(
      id: 'puma',
      name: 'Puma',
      displayName: 'Puma',
      description: 'Forever Faster',
      logoImage: 'assets/images/puma_logo.png',
    ),
    const BrandModel(
      id: 'vans',
      name: 'Vans',
      displayName: 'Vans.',
      description: 'Off The Wall',
      logoImage: 'assets/images/vans_logo.png',
    ),
    const BrandModel(
      id: 'puma',
      name: 'Puma',
      displayName: 'Puma.',
      description: 'Forever Faster',
      logoImage: 'assets/images/puma_logo.png',
    ),
  ];

  Future<List<ProductModel>> getProductsByBrand(String brandName) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));
    
    return _products
        .where((product) => product.brand.toLowerCase() == brandName.toLowerCase())
        .toList();
  }

  Future<List<ProductModel>> getAllProducts() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_products);
  }

  Future<List<BrandModel>> getAllBrands() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_brands);
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));
    
    final lowercaseQuery = query.toLowerCase();
    return _products
        .where((product) =>
            product.name.toLowerCase().contains(lowercaseQuery) ||
            product.brand.toLowerCase().contains(lowercaseQuery) ||
            product.category.toLowerCase().contains(lowercaseQuery))
        .toList();
  }
}
