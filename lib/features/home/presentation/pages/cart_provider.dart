import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  int get itemCount => _items.length;

  double get total => _items.fold(0.0, (sum, item) => sum + ((item['price'] as double?) ?? 0.0));

  void addItem(Map<String, dynamic> product) {
    // Verificar si el producto ya existe en el carrito
    final existingIndex = _items.indexWhere((item) => item['id'] == product['id']);
    
    if (existingIndex >= 0) {
      // Si existe, incrementar cantidad
      _items[existingIndex]['quantity'] = (_items[existingIndex]['quantity'] ?? 1) + 1;
    } else {
      // Si no existe, agregar con cantidad 1
      final newItem = Map<String, dynamic>.from(product);
      newItem['quantity'] = 1;
      _items.add(newItem);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item['id'] == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index]['quantity'] = quantity;
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
