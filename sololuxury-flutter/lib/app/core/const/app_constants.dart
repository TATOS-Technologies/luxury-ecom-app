import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/config/flavor_config.dart';

enum Environment { DEV, STAGING, PROD }

class AppConstants {
  // Network Constants

  static const String baseUrlStaging = "https://qa.sololuxury.com";
  static const String baseUrlProduction = "https://qa.sololuxury.com";

  static String apiEndPointLogin = FlavorConfig.instance.values.baseUrl;
  static String productImageUrl = "$apiEndPointLogin/media/catalog/product/";

  static String apiCountryGet = "http://ip-api.com";

  static const String licenceId = '11434003';

  static String getUrlWithCode() {
    return localStore.currentCode.isEmpty ? "/rest" : "/${localStore.currentCode}/rest";
  }

  static Future<dynamic> dismissKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static const String fontOpenSans = 'OpenSans';
  static const String poppins = 'Poppins';

  static const appID = '36c392ba28ea42bd9caf42b1266019b4';
  static const couponCode = "SOLOAPP10";
}
