import 'package:flutter/material.dart';
import '../../domain/entities/partner.dart';
import '../../usecases/get_partners.dart';

class HomeController extends ChangeNotifier {
  final GetPartners _getPartners;

  HomeController(this._getPartners);

  List<Partner> partners = [];

  // Flags para animaciones escalonadas
  bool showImage = false;
  bool showText = false;
  bool showButton = false;
  bool showPartners = false;

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 150));
    showImage = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 150));
    showText = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 150));
    showButton = true;
    notifyListeners();

    partners = await _getPartners.call();
    await Future.delayed(const Duration(milliseconds: 150));
    showPartners = true;
    notifyListeners();
  }
}
