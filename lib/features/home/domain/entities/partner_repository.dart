import '../entities/partner.dart';

abstract class PartnerRepository {
  Future<List<Partner>> getPartners();
}
