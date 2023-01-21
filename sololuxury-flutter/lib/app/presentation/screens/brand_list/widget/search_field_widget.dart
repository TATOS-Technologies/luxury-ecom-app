import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

class SearchFieldWidget extends GetView<BrandController> {
  const SearchFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.w,
      width: 327.w,
      child: TextFormField(
        controller: controller.searchController,
        cursorColor: appColor,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: SvgPicture.asset(
                AppAsset.svgSearch,
                fit: BoxFit.scaleDown,
              )),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(
            bottom: 12,
            top: 12,
            left: 12,
          ),
          hintText: LanguageConstants.findBrandsText.tr,
          hintStyle:
              AppTextStyle.textStyleUtils500(color: appColor.withOpacity(0.4)),
          errorStyle: AppTextStyle.textStyleError(),
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
        onChanged: (value) {
          if (value.isEmpty) {
            Future<Duration>.delayed(const Duration(milliseconds: 500))
                .then((value) {
              controller.filtersearchAlllist.value = [];
              controller.update();
              controller.isSearchEnable.value = false;
              controller.getBrandList();
            });
          } else {
            controller.setSerchwithAlphabatic(
              value.toUpperCase(),
            );
          }
        },
      ),
    );
  }
}
