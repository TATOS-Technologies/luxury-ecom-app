import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

class AddressItem extends GetView<AddressBookController> {
  final Address? address;
  final int index;

  const AddressItem(this.address, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        controller.addressOnTap(address);
      },
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: homeBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: appTileBorderColor, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.w, right: 15.w),
                    height: 40.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: appTileBorderColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          CommonTextPoppins(
                            '${LanguageConstants.addressText.tr} ${index + 1}',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: appColorPrimary,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.deleteAddressOnTap(address);
                            },
                            child:  Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Icon(
                                Icons.delete,
                                size: 20.r,
                                color: appColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CommonTextPoppins(
                      "${address?.firstname} ${address?.lastname}\n${address?.street?.first}\n${address?.city}\n${address?.postcode}",
                      fontSize: 14.sp,
                      color: appColorPrimary,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.billingCheckButtonOnTap(address);
                        },
                        child: Container(
                          height: 20.w,
                          width: 20.w,
                          padding: EdgeInsets.all(2.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: appColor, width: 2)),
                          child: (address?.isBilling?.value ?? false)
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: appColorPrimary,
                                      borderRadius:
                                          BorderRadius.circular(30.sp)),
                                )
                              : Container(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CommonTextPoppins(
                        LanguageConstants.billingText.tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: appColorPrimary,
                      ),
                      SizedBox(width: 40.w),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          onTap: () {
                            controller.shippingCheckButtonOnTap(address);
                          },
                          child: Container(
                            height: 20.w,
                            width: 20.w,
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: appColor, width: 2)),
                            child: (address?.isShipping?.value ?? false)
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: appColorPrimary,
                                        borderRadius:
                                            BorderRadius.circular(30.sp)),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CommonTextPoppins(
                        LanguageConstants.defaultShipping.tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: appColorPrimary,
                      ),
                      const SizedBox(width: 0),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
