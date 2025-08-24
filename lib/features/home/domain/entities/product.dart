class Product {
  final String id;
  final String name;
  final double price;
  final String brand;
  final String image;
  final String size;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.image,
    required this.size,
    required this.category,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.brand == brand &&
        other.image == image &&
        other.size == size &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        brand.hashCode ^
        image.hashCode ^
        size.hashCode ^
        category.hashCode;
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, brand: $brand, image: $image, size: $size, category: $category)';
  }
}
