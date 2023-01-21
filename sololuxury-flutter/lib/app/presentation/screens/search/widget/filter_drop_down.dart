import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class FilterDropDown extends GetView<SearchController> {
  const FilterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
            width: 327.w,
            child: TextFormField(
              controller: controller.txtList,
              decoration: InputDecoration(
                prefixIcon: SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SvgPicture.asset(
                      AppAsset.search,
                      fit: BoxFit.scaleDown,
                    )),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.only(
                  bottom: 12,
                  top: 12,
                  left: 12,
                ),
                hintText: LanguageConstants.search1Text.tr,
                hintStyle: AppStyle.textStyleUtils500(
                    color: appColor.withOpacity(0.4)),
                errorStyle:
                    AppTextStyle.textStyleError(color: const Color(0xFF973133)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: const BorderSide(
                    color: appBorderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: const BorderSide(
                    color: appBorderColor,
                    width: 1.0,
                  ),
                ),
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: appBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onChanged: (val) {
                controller.onSearchChange(val);
              },
            ),
          ),
        ],
      ),
    );
  }
}
