// import 'package:solo_luxury/app/screens/my_orders/my_orders_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import '../../../core/const/app_style.dart';
import 'order_details_screen/widget/my_order_widget.dart';
import 'order_details_screen/widget/order_textfileds.dart';
import 'order_details_screen/widget/start_chat_button.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: homeBackground,
        appBar: commonAppbar(title: LanguageConstants.myOrdersText.tr),
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
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : controller.myOrdersModel?.value.items?.isEmpty == true
                ? Container(
                    alignment: Alignment.center,
                    height: Get.height / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const NothigToShowAnimationWidget(),
                        Text(
                          LanguageConstants.youHaveNoOrders.tr,
                          style: AppStyle.textStyleUtils400(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                            child: CommonThemeButton(
                          onTap: () {
                            Get.offAndToNamed<dynamic>(
                                RoutesConstants.dashboardScreen);
                          },
                          title: LanguageConstants.continueShopping.tr,
                        ))
                      ],
                    ),
                  )
                : SingleChildScrollView(
                  padding: EdgeInsets.all(24.w),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: appTileBorderColor, width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                height: 40.w,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: appTileBGcolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11),
                    )),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                LanguageConstants.itemOrder.tr,
                                style: AppStyle.textStyleUtils500(size: 14.sp,color: primary),
                              ),
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              ParentItemElement item = (controller
                                          .myOrdersModel
                                          ?.value
                                          .items?[index]
                                          .items
                                          ?.isEmpty ==
                                      true)
                                  ? ParentItemElement()
                                  : controller.myOrdersModel?.value
                                          .items?[index].items?.first ??
                                      ParentItemElement();
                              MyOrdersDataItem? orderData = controller
                                  .myOrdersModel?.value.items?[index];
                              return MyOrderWidget(
                                item: item,
                                orderData: orderData,
                              );
                              // return myOrderWidget();
                            },
                            itemCount: controller
                                    .myOrdersModel?.value.items?.length ??
                                0,
                            separatorBuilder: (context, index) {
                             return const Divider(color: appTileBorderColor,thickness: 2,height: 2,);
                            },
                          ),
                           SizedBox(height: 12.w),
                          Center(
                            child: CommonThemeButton(
                              onTap: () {
                                Get.offAndToNamed<dynamic>(
                                    RoutesConstants.dashboardScreen);
                              },
                              title:
                                LanguageConstants.continueShopping.tr,
                             
                            ),
                          ),
                           SizedBox(height: 12.w)
                        ],
                      ),
                    ),
                  ),
      ),
    );
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
                                    style: AppStyle.textStyleUtils400_16())),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(
                                    LanguageConstants.fillTheFormText.tr,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.textStyleUtils400())),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Container(
                                height: 40,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: appColorAccent,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: const NameTextField()),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 40,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: appColorAccent,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: const EmailTextField()),
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
}
