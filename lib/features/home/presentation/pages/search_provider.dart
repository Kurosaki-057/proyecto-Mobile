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
    // Nike products
    {
      'id': 'nike_1',
      'name': 'Nike SB Dunk Low 88',
      'price': 320000.0,
      'image': 'assets/images/sbdunk88.jpeg',
      'brand': 'Nike',
      'size': '42',
    },
    {
      'id': 'nike_2',
      'name': 'Nike SB Janoski Max',
      'price': 285000.0,
      'image': 'assets/images/Janoski.jpg',
      'brand': 'Nike',
      'size': '41',
    },
    {
      'id': 'nike_3',
      'name': 'Nike Skateboarding Collection',
      'price': 350000.0,
      'image': 'assets/images/Skateboarding.jpg',
      'brand': 'Nike',
      'size': '43',
    },
    {
      'id': 'nike_4',
      'name': 'Nike Classic Collection',
      'price': 280000.0,
      'image': 'assets/images/NIKE.jpg',
      'brand': 'Nike',
      'size': '42',
    },
    {
      'id': 'nike_5',
      'name': 'Nike Antihero Collection',
      'price': 320000.0,
      'image': 'assets/images/NIKEantihero.jpg',
      'brand': 'Nike',
      'size': '41',
    },
    // Converse products
    {
      'id': 'conv_1',
      'name': 'Converse Chuck Taylor All Star',
      'price': 80000.0,
      'image': 'assets/images/CONS.jpg',
      'brand': 'Converse',
      'size': '42',
    },
    {
      'id': 'conv_2',
      'name': 'Converse Chuck 70 High Top',
      'price': 195000.0,
      'image': 'assets/images/Chuck70.jpg',
      'brand': 'Converse',
      'size': '41',
    },
    {
      'id': 'conv_3',
      'name': 'Converse All Star Blue',
      'price': 175000.0,
      'image': 'assets/images/consblue.jpg',
      'brand': 'Converse',
      'size': '43',
    },
    // Vans products
    {
      'id': 'vans_1',
      'name': 'Vans Old Skool Classic',
      'price': 165000.0,
      'image': 'assets/images/Oldsk.jpg',
      'brand': 'Vans',
      'size': '42',
    },
    {
      'id': 'vans_2',
      'name': 'Vans x Anderson .Paak Collection',
      'price': 220000.0,
      'image': 'assets/images/Vans-X-Anderson-Paak.jpg',
      'brand': 'Vans',
      'size': '41',
    },
    {
      'id': 'vans_3',
      'name': 'Vans Anderson Paak Slip-On',
      'price': 185000.0,
      'image': 'assets/images/Vanspaak1.jpg',
      'brand': 'Vans',
      'size': '43',
    },
    {
      'id': 'vans_4',
      'name': 'Vans Anderson Paak Era',
      'price': 175000.0,
      'image': 'assets/images/Vanspaak2.jpeg',
      'brand': 'Vans',
      'size': '40',
    },
    {
      'id': 'vans_5',
      'name': 'Vans Classic Collection',
      'price': 155000.0,
      'image': 'assets/images/VANS.jpeg',
      'brand': 'Vans',
      'size': '44',
    },
    // RipNdip products
    {
      'id': 'rip_1',
      'name': 'RipNdip Classic Collection',
      'price': 150000.0,
      'image': 'assets/images/RPNDP.png',
      'brand': 'Rip N Dip',
      'size': '8.0',
    },
    {
      'id': 'rip_2',
      'name': 'RipNdip Skateboard Complete',
      'price': 280000.0,
      'image': 'assets/images/RPNDP2.jpeg',
      'brand': 'Rip N Dip',
      'size': '8.25',
    },
    {
      'id': 'rip_3',
      'name': 'RipNdip Street Collection',
      'price': 95000.0,
      'image': 'assets/images/knusk.jpg',
      'brand': 'Rip N Dip',
      'size': 'L',
    },
    {
      'id': 'rip_4',
      'name': 'RipNdip Skate Shoes BPC',
      'price': 210000.0,
      'image': 'assets/images/shoesBPC.jpg',
      'brand': 'Rip N Dip',
      'size': '42',
    },
    // Puma products
    {
      'id': 'puma_1',
      'name': 'Puma x RipNdip Collection',
      'price': 180000.0,
      'image': 'assets/images/PUMARPNDP.jpg',
      'brand': 'Puma',
      'size': '42',
    },
    {
      'id': 'puma_2',
      'name': 'Puma Regular Collection',
      'price': 250000.0,
      'image': 'assets/images/REG.jpg',
      'brand': 'Puma',
      'size': '41',
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
        (product['brand']?.toString() ?? '').toLowerCase() == _selectedBrand.toLowerCase()
      ).toList();
    }

    // Filtrar por búsqueda si hay texto
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((product) => 
        (product['name']?.toString() ?? '').toLowerCase().contains(_searchQuery) ||
        (product['brand']?.toString() ?? '').toLowerCase().contains(_searchQuery)
      ).toList();
    }

    return filtered;
  }

  List<Map<String, dynamic>> getProductsByBrand(String brand) {
    return allProducts.where((product) => 
      (product['brand']?.toString() ?? '').toLowerCase() == brand.toLowerCase()
    ).toList();
  }
}
