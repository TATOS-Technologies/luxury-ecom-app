import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DynamicLinkingService {
  // for building deep link
  static Future<String> buildProductPageDynamicLink(String sku) async {
    debugPrint("building dyn link for sku : $sku");
    final dynamicLinkParameters = DynamicLinkParameters(
        link:
            Uri.parse("${AppConstants.baseUrlProduction}/productDetails/$sku"),
        uriPrefix: AppConstants.deeplinkingBaseUrl,
        androidParameters:
            const AndroidParameters(packageName: "com.app.avoirchic"),
        iosParameters: const IOSParameters(
            bundleId: "com.app.avoirchic", appStoreId: "1645310795"));
    final shortLink = await FirebaseDynamicLinks.instance
        .buildShortLink(dynamicLinkParameters);
    final link = shortLink.shortUrl.toString();
    debugPrint("dynamic link : $link");
    return link;
  }

  static Future<PendingDynamicLinkData?>? getInitDynamicLinks() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    return initialLink;
  }

  static registerDynamicLinkHandler() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final paths = event.link.pathSegments;
      debugPrint("paths ${paths.toString()}");
      Get.toNamed(event.link.path);
    });
  }
}
