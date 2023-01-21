import '../../../../../all_imports.dart';

class ReferSuccessfully extends GetView<ReferFriendController> {
  const ReferSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextOpenSans(
              controller.responseMsg.value,
              textAlign: TextAlign.center,
              fontSize: 14.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 160,
              height: 41,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(Get.context!).requestFocus(FocusNode());
                  Get.back<dynamic>();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: CommonTextOpenSans(
                  LanguageConstants.continueShopping.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
