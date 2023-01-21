import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/common_widget/screen_loading.dart';
import 'package:solo_luxury/app/presentation/screens/address_book/widget/address_item.dart';

class AddressBookScreen extends GetView<AddressBookController> {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: homeBackground,
          appBar: commonAppbar(
            title: LanguageConstants.addressBookText.tr,
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                  color: appColor,
                  // size: 50.0,
                ))
              : (controller.getAdressList.value.addresses?.isNotEmpty ?? false)
                  ? Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Obx(
                                () => ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: controller
                                        .getAdressList.value.addresses?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Address? address = controller
                                          .getAdressList
                                          .value
                                          .addresses?[index];
                                      return AddressItem(address, index);
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              child: CommonThemeButton(
                                onTap: () async {
                                    dynamic result = await Get.toNamed<dynamic>(
                                        RoutesConstants.addAdressScreen,
                                        arguments: [
                                          controller.getAdressList.value,
                                          '',
                                          0
                                        ]);
                                    if (result != null &&
                                        result is bool &&
                                        result) {
                                      controller.getAddressList();
                                    }
                                  },
                                 title:
                                      LanguageConstants.addAddress.tr,
                                      ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                        controller.isDefaultLoading.value
                            ? const ScreenLoading()
                            : const SizedBox(),
                      ],
                    )
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const NothigToShowAnimationWidget(),
                        CommonTextPoppins(
                          LanguageConstants.noAddressFound.tr,
                          fontSize: 16.sp,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CommonThemeButton(
                            onTap: () async {
                              bool? result = await Get.toNamed<dynamic>(
                                  RoutesConstants.addAdressScreen,
                                  arguments: [
                                    controller.getAdressList.value,
                                    '',
                                    0
                                  ]) as bool;
                              if (result) {
                                controller.getAddressList();
                              }
                            },
                            title:
                                LanguageConstants.addAddress.tr,
                              ),
                      ],
                    )),
        ));
  }
}
