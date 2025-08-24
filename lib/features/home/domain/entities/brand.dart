class Brand {
  final String id;
  final String name;
  final String displayName;
  final String description;
  final String logoImage;

  const Brand({
    required this.id,
    required this.name,
    required this.displayName,
    required this.description,
    required this.logoImage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Brand &&
        other.id == id &&
        other.name == name &&
        other.displayName == displayName &&
        other.description == description &&
        other.logoImage == logoImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        displayName.hashCode ^
        description.hashCode ^
        logoImage.hashCode;
  }

  @override
  String toString() {
    return 'Brand(id: $id, name: $name, displayName: $displayName, description: $description, logoImage: $logoImage)';
  }
}
