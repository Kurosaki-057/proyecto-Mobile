import '../domain/entities/product.dart';
import '../domain/repositories/product_repository.dart';

class GetProductsByBrand {
  final ProductRepository repository;

  GetProductsByBrand(this.repository);

  Future<List<Product>> call(String brandName) async {
    return await repository.getProductsByBrand(brandName);
  }
}
