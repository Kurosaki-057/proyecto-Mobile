import '../../domain/entities/partner.dart';
import '../../domain/repositories/partner_repository.dart';
import '../datasources/partner_local_data_source.dart';

class PartnerRepositoryImpl implements PartnerRepository {
  final PartnerLocalDataSource localDataSource;
  PartnerRepositoryImpl(this.localDataSource);

  @override
  Future<List<Partner>> getPartners() async {
    final models = await localDataSource.fetchPartners();
    return models.map((m) => m.toEntity()).toList();
  }
}
