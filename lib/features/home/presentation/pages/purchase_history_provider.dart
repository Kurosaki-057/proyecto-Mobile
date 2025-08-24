import 'package:flutter/material.dart';

class PurchaseHistoryProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _purchaseHistory = [];

  List<Map<String, dynamic>> get purchaseHistory => _purchaseHistory;

  int get totalArticles => _purchaseHistory.fold(0, (sum, order) => sum + (order['items'] as List).length);

  void addPurchase(List<Map<String, dynamic>> cartItems) {
    if (cartItems.isEmpty) return;

    final purchase = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'date': DateTime.now(),
      'items': List<Map<String, dynamic>>.from(cartItems),
      'total': cartItems.fold(0.0, (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int)),
    };

    _purchaseHistory.insert(0, purchase); // Agregar al inicio para mostrar más recientes primero
    notifyListeners();
  }

  void clearHistory() {
    _purchaseHistory.clear();
    notifyListeners();
  }

  // Método para obtener todos los artículos de todas las compras (para mostrar en la lista)
  List<Map<String, dynamic>> getAllPurchasedItems() {
    List<Map<String, dynamic>> allItems = [];
    for (var purchase in _purchaseHistory) {
      final items = purchase['items'] as List<Map<String, dynamic>>;
      for (var item in items) {
        allItems.add({
          ...item,
          'purchaseDate': purchase['date'],
          'purchaseTotal': purchase['total'],
        });
      }
    }
    return allItems;
  }
}
