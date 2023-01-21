import 'package:avoirchic/app/core/config/flavor_config.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/cupertino.dart';

import 'main.common.dart';

void main() {
  debugPrint("running ci");
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlStaging);
  FlavorConfig(flavor: Flavor.DEV, values: flavourValue);
  mainCommon();
}
