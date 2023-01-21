import 'package:brandslabels/app/core/config/flavor_config.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:flutter/foundation.dart';

void main() {
  debugPrint("running ci");
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlStaging);
  FlavorConfig(flavor: Flavor.DEV, values: flavourValue);
  mainCommon();
}
