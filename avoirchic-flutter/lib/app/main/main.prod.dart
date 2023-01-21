import 'package:avoirchic/app/core/config/flavor_config.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/main/main.common.dart';

void main() {
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlProduction);
  FlavorConfig(flavor: Flavor.PRODUCTION, values: flavourValue);
  mainCommon();
}
