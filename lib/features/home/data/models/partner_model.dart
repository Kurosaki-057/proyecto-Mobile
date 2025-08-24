import '../../domain/entities/partner.dart';

class PartnerModel {
  final String name;
  final String assetPath;

  PartnerModel({required this.name, required this.assetPath});

  Partner toEntity() => Partner(name: name, assetPath: assetPath);
}
