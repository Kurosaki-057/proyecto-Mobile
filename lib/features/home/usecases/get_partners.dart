import '../domain/entities/partner.dart';
import '../domain/repositories/partner_repository.dart';

class GetPartners {
  final PartnerRepository repository;
  GetPartners(this.repository);

  Future<List<Partner>> call() => repository.getPartners();
}
