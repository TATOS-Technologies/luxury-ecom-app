import 'package:suvandnat/app/core/config/flavor_config.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/main/main.common.dart';

void main() {
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlProduction);
  FlavorConfig(flavor: Flavor.PRODUCTION, values: flavourValue);
  mainCommon();
}
