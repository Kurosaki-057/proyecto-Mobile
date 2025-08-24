import '../domain/entities/brand.dart';
import '../domain/repositories/product_repository.dart';

class GetAllBrands {
  final ProductRepository repository;

  GetAllBrands(this.repository);

  Future<List<Brand>> call() async {
    return await repository.getAllBrands();
  }
}
