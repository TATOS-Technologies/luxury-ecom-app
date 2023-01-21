import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DynamicLinkingService {
  // for building deep link
  static Future<String> buildProductPageDynamicLink(String sku) async {
    debugPrint("building dyn link for sku : $sku");
    final dynamicLinkParameters = DynamicLinkParameters(
        link: Uri.parse("https://www.sololuxury.com/productDetails/$sku"),
        uriPrefix: "https://sololuxury.page.link/",
        androidParameters:
            const AndroidParameters(packageName: "com.app.sololuxury"),
        iosParameters: const IOSParameters(
            bundleId: "com.app.sololuxury", appStoreId: "1645310795"));
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

  static Future<void> registerDynamicLinkHandler() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final paths = event.link.pathSegments;
      debugPrint(paths.toString());
      Get.toNamed<dynamic>(event.link.path);
    });
  }
}
