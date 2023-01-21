import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/product_listing/product_list_add_dialog.dart';
import 'widgets/product_filter_widget.dart';
import 'widgets/product_list_textfields.dart';
import 'widgets/products_widget.dart';
import 'widgets/start_chat_button.dart';

class ProductListScreen extends GetView<ProductController> {
  ProductListScreen({Key? key}) : super(key: key);

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: homeBackground,
          appBar: commonAppbar(
            title: controller.title.value,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: appColorPrimary,
            onPressed: () {
              if (localStore.customerToken.toString() == "") {
                showTitleDialog(context);
              } else {
                controller.clickChatEvent();
              }
            },
            child: SvgPicture.asset(AppAsset.svgLiveChat),
          ),
          body: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: appColor,
                      // size: 50.0,
                    ),
                  )
                : NotificationListener<ScrollNotification>(
                    onNotification: controller.scrollNotificationData,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.5),
                      child: Center(
                        child: Column(
                          children: [
                            controller.productModel?.value.items?.isNotEmpty ?? false
                                ? const ProductFilterWidget()
                                : const SizedBox(),
                            SizedBox(height: 15.h),
                            // FilterDropDown(),
                            Expanded(
                              child: ProductsWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ));
  }

  Future showTitleDialog(BuildContext context) {
    return showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: backGroundColor,
            insetPadding: const EdgeInsets.all(10),
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: -45.0,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: appColor,
                    child: Image.asset(
                      AppAsset.account,
                      color: Colors.white,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        //height: 70,
                        margin: const EdgeInsets.only(top: 60),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                LanguageConstants.welcometoChatText.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400_16(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                LanguageConstants.fillTheFormText.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: appColorAccent,
                                border: Border.all(
                                  color: appColor,
                                  width: 1,
                                ),
                              ),
                              child: const NameTextField(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: appColorAccent,
                                border: Border.all(
                                  color: appColor,
                                  width: 1,
                                ),
                              ),
                              child: const EmailTextField(),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: StartChatButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showAddDialog(BuildContext context, ProductItem item) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return ProductListAddDialog(
          item: item,
        );
      },
    );
  }
}

extension StringExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
