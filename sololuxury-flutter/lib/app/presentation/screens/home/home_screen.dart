import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

import 'widget/brand_list_widgets.dart';
import 'widget/offer_banner_widget.dart';
import 'widget/purchase_code_banner_widget.dart';
import 'widget/trending_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  static List<String> brands = [
    ' ALEXANDER McQUEEN',
    'BALENCIAGA',
    'BOTTEGA VENETA',
    'BURBERRY',
    'BVLGARI',
    'CELINE',
    'CHLOE',
    'CHRISTIAN DIOR',
    'COACH',
    'DOLCE AND GABBANA',
    'FENDI',
    'GIVENCHY',
    'GUCCI',
    'ISSEY MIYAKE',
    'JIMMY CHOO',
    'KENZO',
    'MARC JACOBS',
    'MICHEAL KORS',
    'MIU MIU',
    'MOSCHINO',
    'OFF WHITE',
    'Prada',
    'RED VALENTINO',
    'SALVATORE FERRAGAMO',
    'STELLA MCCARTNEY',
    'TODS',
    'TOM FORD',
    'TORY BURCH',
    'VALENTINO GARAVANI',
    'VERSACE',
    'Prada',
    'RED VALENTINO',
    'SALVATORE FERRAGAMO',
    'STELLA MCCARTNEY',
    'YVES SAINT LAURENT',
  ];

  static List<String> brandIcons = [
    AppAsset.mcQUEEN,
    AppAsset.balenciaga,
    AppAsset.bottegaveneta,
    AppAsset.burberry,
    AppAsset.bvlgari,
    AppAsset.celine,
    AppAsset.chloe,
    AppAsset.christianDior,
    AppAsset.coach,
    AppAsset.dg,
    AppAsset.fendi,
    AppAsset.givenchy,
    AppAsset.gucci,
    AppAsset.isseymiyaje,
    AppAsset.jimmychoo,
    AppAsset.kenzo,
    AppAsset.marcjacobs,
    AppAsset.michelkore,
    AppAsset.miuMiu,
    AppAsset.moschino,
    AppAsset.offWhite,
    AppAsset.prada,
    AppAsset.redvalentino,
    AppAsset.salvatoreferragamo,
    AppAsset.stellamccartney,
    AppAsset.tods,
    AppAsset.tomford,
    AppAsset.toryburch,
    AppAsset.valentinogaravani,
    AppAsset.versace,
    AppAsset.prada,
    AppAsset.redvalentino,
    AppAsset.stellamccartney,
    AppAsset.yvessaintlaurent,
    AppAsset.yvessaintlaurent,
    AppAsset.yvessaintlaurent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
            ),
            BrandListWidget(brands: brands, brandIcons: brandIcons),
            const PurchaseCodeBannerWidget(),
            SizedBox(
              height: 20.h,
            ),
            const OfferBannerWidget(),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => Column(
                  children: List.generate(
                    controller.homeTileModel.length,
                    (index) =>controller.menuModel!.value.childrenData![index].isActive?? false? TrendingWidget(
                      id: controller.menuModel!.value.childrenData![index].id
                          .toString(),
                      title: controller
                          .menuModel!.value.childrenData![index].name
                          .toString(),
                      productModel:controller.homeTileModel[index],
                      isEmpty: controller.homeTileModel[index]!.totalCount==0,
                    ):Container(),
                  ),
                )),
            // const TrendingWidget(),
            Divider(color: brownF3E5DE, thickness: 1.w),
            // const WhatsNewWidget(),
            // SizedBox(
            //   height: 20.h,
            // ),
            // const OthersViewTheseWidget(),
            // const MostPopularWidget(),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
