import 'package:flutter/foundation.dart';
import 'package:suvandnat/app/core/config/flavor_config.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';

void main() {
  debugPrint("running ci");
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlStaging);
  FlavorConfig(flavor: Flavor.PRODUCTION, values: flavourValue);
  mainCommon();
}
