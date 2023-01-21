import '../../../../../all_imports.dart';

class AddressPart extends StatelessWidget {
  const AddressPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AffiliateProgramController>(
      id: "affil",
      builder: (controller) {
        return Column(
          children: [
            HeadlineBodyOneBaseWidget(
              title: LanguageConstants.addressText.tr,
              titleColor: Colors.black,
              titleTextAlign: TextAlign.center,
              underline: true,
              fontSize: 16.0,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: Get.width,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.selectedVisitorValue.value =
                                value.toString();
                          },
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.selectedVisitorValue.value,
                          items: <String>[
                            LanguageConstants.visitorMonthHintText.tr,
                            LanguageConstants.mr.tr,
                            LanguageConstants.mrs.tr
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                    titleColor: Colors.grey,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: Get.width,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.selectedViewsValue.value =
                                value.toString();
                          },
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.selectedViewsValue.value,
                          items: <String>[
                            LanguageConstants.viewsMonthHintText.tr,
                            LanguageConstants.mr.tr,
                            LanguageConstants.mrs.tr
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                    titleColor: Colors.grey,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormFieldWidget(
                      controller: controller.addressOneController.value,
                      focusNode: controller.addressOneFocusNode.value,
                      keyboardType: TextInputType.streetAddress,
                      unFillField: true,
                      hintText:
                          (controller.addressOneController.value.text == "" &&
                                  controller.isSubmitButtonPressed)
                              ? LanguageConstants.enterStreetAddress1.tr
                              : LanguageConstants.addressOneText.tr,
                      hintStyle:
                          AppTextStyle.textStyleUtils400(color: Colors.grey),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormFieldWidget(
                      controller: controller.addressTwoController.value,
                      focusNode: controller.addressTwoFocusNode.value,
                      keyboardType: TextInputType.streetAddress,
                      unFillField: true,
                      hintText:
                          (controller.addressTwoController.value.text == "" &&
                                  controller.isSubmitButtonPressed)
                              ? LanguageConstants.enterStreetAdress2.tr
                              : LanguageConstants.addressTwoText.tr,
                      hintStyle:
                          AppTextStyle.textStyleUtils400(color: Colors.grey),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: Get.width,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.cityValue.value = value.toString();
                          },
                          style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: AppConstants.fontOpenSans),
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.cityValue.value,
                          items: <String>[
                            LanguageConstants.cityHintText.tr,
                            LanguageConstants.mr.tr,
                            LanguageConstants.mrs.tr
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                    titleColor: Colors.grey,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    width: Get.width,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.countryValue.value = value.toString();
                          },
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.countryValue.value,
                          items: <String>[
                            LanguageConstants.countryHintText.tr,
                            LanguageConstants.mr.tr,
                            LanguageConstants.mrs.tr
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                    titleColor: Colors.grey,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 40,
                    width: Get.width,
                    child: TextFormFieldWidget(
                      controller: controller.postCodeController.value,
                      focusNode: controller.postCodeFocusNode.value,
                      keyboardType: TextInputType.streetAddress,
                      unFillField: true,
                      hintText:
                          (controller.postCodeController.value.text == "" &&
                                  controller.isSubmitButtonPressed)
                              ? LanguageConstants.enterZipPostalCode
                              : LanguageConstants.postCodeText.tr,
                      hintStyle:
                          AppTextStyle.textStyleUtils400(color: Colors.grey),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
