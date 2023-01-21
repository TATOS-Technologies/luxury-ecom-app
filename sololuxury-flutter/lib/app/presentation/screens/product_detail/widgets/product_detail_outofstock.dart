import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class OutOfStock extends GetView<ProductDetailController> {
  const OutOfStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Obx(() {
        return controller.isAddToCartLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                ),
              )
            : Stack(
                children: [
                  Positioned(
                      top: 40,
                      left: 10,
                      child: GestureDetector(
                          onTap: () {
                            Get.back<dynamic>();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.thankYou.tr,
                        style: AppStyle.textStyleUtils400(size: 20.0)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () async {
                            await controller.notifyOnClick();
                          },
                          child: Text.rich(
                            TextSpan(
                                text: LanguageConstants
                                    .notifyMeWhenThisProductIsInStock.tr,
                                style: AppStyle.textStyleUtils400(size: 10.0)
                                    .copyWith(fontFamily: "Poppins"),
                                children: <InlineSpan>[
                                  const TextSpan(text: "  "),
                                  TextSpan(
                                    text: LanguageConstants.myTicket.tr,
                                    style:
                                        AppStyle.textStyleUtils400().copyWith(
                                      fontFamily: "Poppins",
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Get.back<dynamic>();
                          },
                          child: Text(
                            LanguageConstants.continueShopping.tr,
                            style: AppStyle.textStyleUtils400().copyWith(
                                fontFamily: "Poppins",
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
