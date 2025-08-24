import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/brand.dart';
import '../../usecases/get_products_by_brand.dart';
import '../../usecases/get_all_brands.dart';

class BrandController extends ChangeNotifier {
  final GetProductsByBrand getProductsByBrand;
  final GetAllBrands getAllBrands;

  BrandController({
    required this.getProductsByBrand,
    required this.getAllBrands,
  });

  List<Product> _products = [];
  List<Brand> _brands = [];
  bool _isLoading = false;
  String? _error;
  String _sortBy = 'posicion';

  List<Product> get products => _products;
  List<Brand> get brands => _brands;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get sortBy => _sortBy;

  Future<void> loadProductsByBrand(String brandName) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await getProductsByBrand(brandName);
      _sortProducts();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAllBrands() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _brands = await getAllBrands();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSortBy(String sortBy) {
    _sortBy = sortBy;
    _sortProducts();
    notifyListeners();
  }

  void _sortProducts() {
    switch (_sortBy) {
      case 'precio_asc':
        _products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'precio_desc':
        _products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'nombre':
        _products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'posicion':
      default:
        // Mantener orden original
        break;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
