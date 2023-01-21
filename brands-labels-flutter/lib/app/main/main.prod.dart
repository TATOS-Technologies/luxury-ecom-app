import 'package:brandslabels/app/core/config/flavor_config.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:flutter/foundation.dart';

void main() {
  debugPrint("running prod");
  var flavourValue = FlavorValues(baseUrl: AppConstants.baseUrlProduction);
  FlavorConfig(flavor: Flavor.PRODUCTION, values: flavourValue);
  mainCommon();
}
