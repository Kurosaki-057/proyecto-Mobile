import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _searchQuery = '';
  String _selectedBrand = '';
  
  String get searchQuery => _searchQuery;
  String get selectedBrand => _selectedBrand;

  // Marcas disponibles
  final List<String> availableBrands = [
    'Nike',
    'Converse', 
    'Vans',
    'Rip N Dip',
    'Puma',
  ];

  // Productos simulados para demostración
  final List<Map<String, dynamic>> allProducts = [
    {
      'id': 'nike_1',
      'name': 'Nike SB dunk low pro 88\' club',
      'price': 750000.00,
      'image': 'assets/images/nike_sb_dunk.png',
      'brand': 'Nike',
      'size': '10',
    },
    {
      'id': 'conv_1',
      'name': 'Converse Run star trainer navy blue',
      'price': 500000.00,
      'image': 'assets/images/converse_navy.png',
      'brand': 'Converse',
      'size': '42',
    },
    {
      'id': 'conv_2',
      'name': 'Converse Chuck Taylor All Star High',
      'price': 450000.00,
      'image': 'assets/images/converse_black.png',
      'brand': 'Converse',
      'size': '41',
    },
    {
      'id': 'puma_1',
      'name': 'Puma suede X ripndip "baby blue"',
      'price': 650000.00,
      'image': 'assets/images/puma_suede.png',
      'brand': 'Puma',
      'size': '10.5',
    },
    {
      'id': 'nike_2',
      'name': 'Nike SB blazer X antihero',
      'price': 600000.00,
      'image': 'assets/images/nike_blazer.png',
      'brand': 'Nike',
      'size': '10',
    },
  ];

  void updateSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  void selectBrand(String brand) {
    _selectedBrand = brand;
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedBrand = '';
    notifyListeners();
  }

  List<Map<String, dynamic>> getFilteredProducts() {
    List<Map<String, dynamic>> filtered = allProducts;

    // Filtrar por marca si está seleccionada
    if (_selectedBrand.isNotEmpty) {
      filtered = filtered.where((product) => 
        product['brand'].toString().toLowerCase() == _selectedBrand.toLowerCase()
      ).toList();
    }

    // Filtrar por búsqueda si hay texto
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((product) => 
        product['name'].toString().toLowerCase().contains(_searchQuery) ||
        product['brand'].toString().toLowerCase().contains(_searchQuery)
      ).toList();
    }

    return filtered;
  }

  List<Map<String, dynamic>> getProductsByBrand(String brand) {
    return allProducts.where((product) => 
      product['brand'].toString().toLowerCase() == brand.toLowerCase()
    ).toList();
  }
}
