import '../models/partner_model.dart';

class PartnerLocalDataSource {
  Future<List<PartnerModel>> fetchPartners() async {
    // Simula una carga local/archivo
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      PartnerModel(name: 'Nike', assetPath: 'assets/logos/nike.png'),
      PartnerModel(name: 'Vans', assetPath: 'assets/logos/vans.png'),
      PartnerModel(name: 'DC Shoes', assetPath: 'assets/logos/dc.png'),
      PartnerModel(name: 'Osiris', assetPath: 'assets/logos/osiris.png'),
      PartnerModel(name: 'RipNDip', assetPath: 'assets/logos/ripndip.png'),
    ];
  }
}
