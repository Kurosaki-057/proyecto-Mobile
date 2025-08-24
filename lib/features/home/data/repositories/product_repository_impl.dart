import '../../domain/entities/product.dart';
import '../../domain/entities/brand.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getProductsByBrand(String brandName) async {
    final productModels = await dataSource.getProductsByBrand(brandName);
    return productModels.cast<Product>();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final productModels = await dataSource.getAllProducts();
    return productModels.cast<Product>();
  }

  @override
  Future<List<Brand>> getAllBrands() async {
    final brandModels = await dataSource.getAllBrands();
    return brandModels.cast<Brand>();
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final productModels = await dataSource.searchProducts(query);
    return productModels.cast<Product>();
  }
}
