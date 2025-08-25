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
      image: 'assets/images/CONS.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'conv_2',
      name: 'Converse Chuck 70 High Top',
      price: 195000,
      brand: 'Converse',
      image: 'assets/images/Chuck70.jpg',
      size: '41',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'conv_3',
      name: 'Converse All Star Blue',
      price: 175000,
      brand: 'Converse',
      image: 'assets/images/consblue.jpg',
      size: '43',
      category: 'Sneakers',
    ),
    // RipNdip products
    ProductModel(
      id: 'rip_1',
      name: 'RipNdip Classic Collection',
      price: 150000,
      brand: 'RipNdip',
      image: 'assets/images/RPNDP.png',
      size: '8.0',
      category: 'Skate',
    ),
    ProductModel(
      id: 'rip_2',
      name: 'RipNdip Skateboard Complete',
      price: 280000,
      brand: 'RipNdip',
      image: 'assets/images/RPNDP2.jpeg',
      size: '8.25',
      category: 'Skate',
    ),
    ProductModel(
      id: 'rip_3',
      name: 'RipNdip Street Collection',
      price: 95000,
      brand: 'RipNdip',
      image: 'assets/images/knusk.jpg',
      size: 'L',
      category: 'Clothing',
    ),
    ProductModel(
      id: 'rip_4',
      name: 'RipNdip Skate Shoes BPC',
      price: 210000,
      brand: 'RipNdip',
      image: 'assets/images/shoesBPC.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    // Puma products for sales
    ProductModel(
      id: 'puma_1',
      name: 'Puma x RipNdip Collection',
      price: 180000,
      brand: 'Puma',
      image: 'assets/images/PUMARPNDP.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'puma_2',
      name: 'Puma Regular Collection',
      price: 250000,
      brand: 'Puma',
      image: 'assets/images/REG.jpg',
      size: '41',
      category: 'Sneakers',
    ),
    // Vans products
    ProductModel(
      id: 'vans_1',
      name: 'Vans Old Skool Classic',
      price: 165000,
      brand: 'Vans',
      image: 'assets/images/Oldsk.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'vans_2',
      name: 'Vans x Anderson .Paak Collection',
      price: 220000,
      brand: 'Vans',
      image: 'assets/images/Vans-X-Anderson-Paak.jpg',
      size: '41',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'vans_3',
      name: 'Vans Anderson Paak Slip-On',
      price: 185000,
      brand: 'Vans',
      image: 'assets/images/Vanspaak1.jpg',
      size: '43',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'vans_4',
      name: 'Vans Anderson Paak Era',
      price: 175000,
      brand: 'Vans',
      image: 'assets/images/Vanspaak2.jpeg',
      size: '40',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'vans_5',
      name: 'Vans Classic Collection',
      price: 155000,
      brand: 'Vans',
      image: 'assets/images/VANS.jpeg',
      size: '44',
      category: 'Sneakers',
    ),
    // Additional RipNdip products
    ProductModel(
      id: 'rip_4',
      name: 'RipNdip Skateboard Complete',
      price: 280000,
      brand: 'RipNdip',
      image: 'assets/images/RPNDP2.jpeg',
      size: '8.25',
      category: 'Skate',
    ),
    ProductModel(
      id: 'rip_5',
      name: 'RipNdip Street Collection Tee',
      price: 95000,
      brand: 'RipNdip',
      image: 'assets/images/knusk.jpg',
      size: 'L',
      category: 'Clothing',
    ),
    ProductModel(
      id: 'rip_6',
      name: 'RipNdip Skate Shoes BPC',
      price: 210000,
      brand: 'RipNdip',
      image: 'assets/images/shoesBPC.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    // Nike SB products using available images
    ProductModel(
      id: 'nike_1',
      name: 'Nike SB Dunk Low 88',
      price: 320000,
      brand: 'Nike',
      image: 'assets/images/sbdunk88.jpeg',
      size: '42',
      category: 'Skateboarding',
    ),
    ProductModel(
      id: 'nike_2',
      name: 'Nike SB Janoski Max',
      price: 285000,
      brand: 'Nike',
      image: 'assets/images/Janoski.jpg',
      size: '41',
      category: 'Skateboarding',
    ),
    ProductModel(
      id: 'nike_3',
      name: 'Nike Skateboarding Collection',
      price: 350000,
      brand: 'Nike',
      image: 'assets/images/Skateboarding.jpg',
      size: '43',
      category: 'Skateboarding',
    ),
    ProductModel(
      id: 'nike_4',
      name: 'Nike Classic Collection',
      price: 280000,
      brand: 'Nike',
      image: 'assets/images/NIKE.jpg',
      size: '42',
      category: 'Sneakers',
    ),
    ProductModel(
      id: 'nike_5',
      name: 'Nike Antihero Collection',
      price: 320000,
      brand: 'Nike',
      image: 'assets/images/NIKEantihero.jpg',
      size: '41',
      category: 'Skateboarding',
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
