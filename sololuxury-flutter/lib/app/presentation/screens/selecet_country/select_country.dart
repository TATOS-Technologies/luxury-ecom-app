import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class SelectCountryScreen extends GetView<SelectCountryController> {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectCountryController controller = Get.find<SelectCountryController>();

    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              controller.scaffoldKey.value.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(ImageConstant.menuIcon),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.searchIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.heartIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                    color: Colors.black),
              ),
            ),
          ],
          title: Image.asset(AppAsset.logo, width: 110),
        ),
        drawer: const Drawer(),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.chooseYourCountryText.tr,
                        textAlign: TextAlign.center,
                        style: AppStyle.textStyleUtils500(
                                size: 18, color: appColor)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: controller.textController.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.only(
                              bottom: 10, top: 10, left: 20),
                          hintText: LanguageConstants.findCountry.tr,
                          hintStyle: AppStyle.textStyleUtils400(
                              color: appColor.withOpacity(0.4)),
                          labelStyle:
                              AppStyle.textStyleUtils400(color: Colors.black54),
                          errorStyle:
                              AppStyle.textStyleUtils400(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0),
                            borderSide: const BorderSide(
                              color: appColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(36.0),
                            borderSide: const BorderSide(
                              color: appColor,
                              width: 1.0,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                color: appColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.searchIcon,
                                color: Colors.white,
                                height: 14,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: appColor,
                            ),
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                        ),
                        onChanged: (String value) {
                          controller.onSearchTextChanged(
                              controller.textController.value.text);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: RawScrollbar(
                        thumbColor: appColor,
                        radius: const Radius.circular(20),
                        thickness: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: appColor,
                                height: 0,
                                thickness: 1.2,
                              );
                            },
                            itemCount: controller.getSearchList.isEmpty
                                ? controller.getcountryList.length
                                : controller.getSearchList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final countryList =
                                  controller.getSearchList.isEmpty
                                      ? controller.getcountryList[index]
                                      : controller.getSearchList[index];
                              return Theme(
                                data: ThemeData()
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ListTileTheme(
                                  contentPadding: const EdgeInsets.all(0),
                                  dense: true,
                                  horizontalTitleGap: 0.0,
                                  minLeadingWidth: 0,
                                  child: ExpansionTile(
                                    childrenPadding: EdgeInsets.zero,
                                    tilePadding: EdgeInsets.zero,
                                    title: Row(
                                      children: [
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: appColor,
                                          size: 32,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${countryList.fullNameEnglish}'
                                                .toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style:
                                                AppStyle.textStyleUtils400_16(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: const SizedBox(
                                      height: 2,
                                      width: 2,
                                    ),
                                    children: [
                                      Column(
                                        children: [
                                          countryList.availableRegions
                                                          .toString() ==
                                                      "null" ||
                                                  countryList.availableRegions!
                                                          .toString() ==
                                                      "[]"
                                              ? Container()
                                              : ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: countryList
                                                      .availableRegions?.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    final countryInsideList =
                                                        countryList
                                                                .availableRegions![
                                                            index];
                                                    return Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 6),
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xffF0DDD5),
                                                              border: Border(
                                                                top: BorderSide(
                                                                    width: 1.2,
                                                                    color:
                                                                        appColor),
                                                              )),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color: appColor,
                                                            size: 32,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "${countryInsideList.name}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
