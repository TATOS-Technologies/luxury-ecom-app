import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class BrandListWidget extends GetView<HomeController> {
  const BrandListWidget({
    Key? key,
    required this.brands,
    required this.brandIcons,
  }) : super(key: key);

  final List<String> brands;
  final List<String> brandIcons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120.w,
            width: double.infinity,
            child: CarouselSlider.builder(
                itemCount: brands.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SizedBox(
                      width: 90.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed<dynamic>(
                            RoutesConstants.productListScreen,
                            arguments: [
                              "brand",
                              '', // countryInsideList.attributeId, for designer brand
                              brands[index], // brand name
                            ],
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.w,
                              width: 60.w,
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.h,
                                        offset: Offset(2.w, 2.w),
                                        color: Colors.black.withOpacity(0.18))
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: homeTileBackground.withOpacity(.6),
                                    borderRadius: BorderRadius.circular(60)),
                                child: Center(
                                  child: SizedBox(
                                      height: 35.w,
                                      width: 35.w,
                                      child: Image.asset(
                                        brandIcons[index],
                                        fit: BoxFit.contain,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              brands[index],
                              style: AppStyle.textStyleUtils600(size: 12.sp),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1 / 4,
                    enableInfiniteScroll: true,
                    autoPlayCurve: Curves.easeInOut,
                    pauseAutoPlayInFiniteScroll: false)))
      ],
    );
  }
}
