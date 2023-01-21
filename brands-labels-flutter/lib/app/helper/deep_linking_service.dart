import 'package:brandslabels/app/core/config/flavor_config.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DynamicLinkingService {
  // for building deep link
  static Future<String> buildProductPageDynamicLink(String sku) async {
    try {
      debugPrint("building dyn link for sku : $sku");
      final dynamicLinkParameters = DynamicLinkParameters(
          link: Uri.parse(
              "${FlavorConfig.instance.values.baseUrl}/productDetails/$sku"),
          uriPrefix: AppConstants.deeplinkBaseUrl,
          androidParameters:
              const AndroidParameters(packageName: "com.app.brandslabels"),
          iosParameters: const IOSParameters(
              bundleId: "com.app.brandslabels", appStoreId: "1645310795"));
      final shortLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParameters);
      final link = shortLink.shortUrl.toString();
      debugPrint("dynamic link : $link");
      return link;
    } catch (e) {
      debugPrint("error in dynamic link service ${e.toString()}");
      rethrow;
    }
  }

  static Future<PendingDynamicLinkData?>? getInitDynamicLinks() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    return initialLink;
  }

  static registerDynamicLinkHandler() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final paths = event.link.pathSegments;
      debugPrint(paths.toString());
      Get.toNamed(event.link.path);
    });
  }
}
