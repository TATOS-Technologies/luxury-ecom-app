import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/config/flavor_config.dart';

/// For handling prod flavour
void main() {
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlProduction);
  FlavorConfig(flavor: Flavor.PRODUCTION, values: flavourValue);
  mainCommon();
}
