import 'package:flutter/foundation.dart';
import 'package:solo_luxury/app/core/config/flavor_config.dart';
import 'package:solo_luxury/app/core/const/app_constants.dart';

import 'main.common.dart';

/// For handling ci flavour
void main() {
  debugPrint("running ci");
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlStaging);
  FlavorConfig(flavor: Flavor.PRODUCTION, values: flavourValue);
  mainCommon();
}
