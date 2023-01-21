import 'package:brandslabels/app/controller/product_detail_controller.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/screens/my_orders/widgets/show_ticket_response.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/widgets/create_ticket_best_price_dialog.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

class ProductDetailRecommendedProducts extends GetView<ProductDetailController> {
  const ProductDetailRecommendedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 24.w),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: controller.itemsData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.onItemTap(index);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: SizedBox(
              width: 140.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 145.w,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.itemsData[index].imageUrl ?? '',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment(.8, -.8),
                      child: Icon(
                        Icons.favorite_border,
                        color: darkBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          controller.itemsData[index].name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${controller.itemsData[index].price}",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils600_16(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future showPriceMatch(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          backgroundColor: regularF5F5F5,
          insetPadding: const EdgeInsets.all(10),
          contentWidget: Stack(
            children: [
              Container(
                height: 300,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.yourBestPriceAlways.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine14(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.ifYourPreferredItemIsLowerMsg.tr,
                        style: AppTextStyle.textStyleUtils400(color: silver),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showPriceMatchTicketDialog(false);
                        },
                        child: Text(
                          LanguageConstants.simplyLetUsKnowByClickingHere.tr,
                          style: AppTextStyle.textStyleUtils400(color: darkBlue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showPriceMatchTicketDialog(true);
                        },
                        child: Text(
                          LanguageConstants.alreadyMadeYourPurchase.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine14(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesConstants.contactUsScreen);
                        },
                        child: Text(
                          LanguageConstants.dontWorryLetUsKnowByClickingMsg.tr,
                          style: AppTextStyle.textStyleUtils400(color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesConstants.faqScreen);
                        },
                        child: Text(
                          LanguageConstants.pleaseSeeFAQsByClickingHere.tr,
                          style: AppTextStyle.textStyleUtils400(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: darkBlue,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showPriceMatchTicketDialog(bool isPurchased) {
    controller.firstNameController.text = localStore.userDetail.firstname ?? '';
    controller.lastNameController.text = localStore.userDetail.lastname ?? '';
    controller.productNameController.text = controller.product?.value.name ?? '';
    controller.styleController.text = controller.product?.value.sku ?? '';
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketForBestPriceMatchDialog(
          formKey: controller.formKey,
          phoneNumberController: controller.phoneNumberController,
          emailController: TextEditingController(text: localStore.userDetail.email),
          firstNameController: controller.firstNameController,
          lastNameController: controller.lastNameController,
          urlOfImageController: controller.urlOfImageController,
          remarksController: controller.remarksController,
          isProductAvailableController: controller.isProductAvailableController,
          priceController: controller.priceController,
          linkCheaperProductController: controller.linkCheaperProductController,
          urlOfWebsiteController: controller.urlOfWebsiteController,
          styleController: controller.styleController,
          productNameController: controller.productNameController,
          keywordController: controller.keywordController,
          onTap: () async {
            if (controller.formKey.currentState?.validate() ?? false) {
              String msg = await controller.createMyTicketForCancelItemOrder(isPurchased);
              Get.back();
              showTicketResponseDialog(Get.context!, msg);
            }
          },
        );
      },
    );
  }

  void showTicketResponseDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowTicketResponse(
          message: message,
        );
      },
    );
  }
}
