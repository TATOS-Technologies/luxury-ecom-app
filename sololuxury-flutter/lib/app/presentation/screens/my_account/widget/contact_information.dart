import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/controller/my_account/my_account_information_controller.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class ContactInformation extends GetView<MyAccountInformationController> {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: homeBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appTileBorderColor, width: 2),
      ),

      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.w,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: appTileBGcolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: CommonTextPoppins(
                        LanguageConstants.contactInformation.tr,
                        fontSize: 14.sp,
                        color: appColorPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.w, left: 20.w),
                child: CommonTextPoppins(
                  "${localStore.userDetail.firstname}"
                  "${localStore.userDetail.lastname}",
                  fontSize: 14.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.w, left: 20.w),
                child: CommonTextPoppins(
                  localStore.userDetail.email ?? '',
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: VerticalDivider(color: appColorDullPrimary),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CommonThemeButton(
                    onTap: () async{
                       await Get.toNamed<dynamic>(
                        RoutesConstants.signUpScreen,
                        arguments: [
                          
                          1,
                          controller.myAccountModel.value,
                          
                        ]);
                   
                      controller.getMyAccountDataFromApi();
                   
                    },
                    title:
                      LanguageConstants.edit.tr,
                      
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: SizedBox(
                    child: CommonThemeButton(
                      isOutLined: true,
                      buttonColor: homeBackground,
                      textColor: primary,
                      onTap: () {
                        Get.toNamed<dynamic>(RoutesConstants.changePasswordScreen);
                      },
                      title:
                        LanguageConstants.changePassword.tr,
                       
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
