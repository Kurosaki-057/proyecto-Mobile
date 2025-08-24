import '../entities/product.dart';
import '../entities/brand.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductsByBrand(String brandName);
  Future<List<Product>> getAllProducts();
  Future<List<Brand>> getAllBrands();
  Future<List<Product>> searchProducts(String query);
}
