import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';
import 'package:solo_luxury/all_imports.dart';

class StoreCreditListItem extends GetView<StoreCreditController> {
  final StoreCreditModel? storeData;

  const StoreCreditListItem(this.storeData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.w),
      child: Container(
        // padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
            // color: appTileBGcolor,
            border: Border.all(color: appTileBorderColor, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: const BoxDecoration(
                  color: appTileBGcolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: CommonTextPoppins(
                              "${LanguageConstants.date.tr} : ${storeData?.atTime}",
                              fontSize: 14.sp,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CommonTextPoppins(
                          LanguageConstants.description.tr,
                          fontSize: 14.sp,
                        )),
                        Expanded(
                          flex: 2,
                          child: CommonTextPoppins(
                            "${storeData?.summary}",
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextPoppins(
                          LanguageConstants.amount.tr,
                          fontSize: 14.sp,
                        ),
                        const SizedBox(height: 10),
                        CommonTextPoppins(
                          "${storeData?.amount}",
                          fontSize: 14.sp,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonTextPoppins(
                          LanguageConstants.balance.tr,
                          fontSize: 14.sp,
                        ),
                        const SizedBox(height: 10),
                        CommonTextPoppins(
                          "${storeData?.balance}",
                          fontSize: 14.sp,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonTextPoppins(
                          LanguageConstants.enterRemarks.tr,
                          fontSize: 14.sp,
                        ),
                        const SizedBox(height: 10),
                        CommonTextPoppins(
                          "${storeData?.used}",
                          fontSize: 14.sp,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
