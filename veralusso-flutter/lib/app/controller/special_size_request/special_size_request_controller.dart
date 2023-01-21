import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/special_size_api_repository.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class SpecialSizeRequestController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;

  var slectSize = "".obs;
  List<String> sizeList = ["1", "2", "3", "4"];

  SpecialSizeAPIRepository specialSizeAPIRepository = SpecialSizeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  SpecialSizeRequestController({this.countryCode});

  Future<void> postSpecialSize(BuildContext context, formKey) async {
    const website = "www.veralusso.com";
    try {
      await specialSizeAPIRepository.postSpecialSizeApiResponse(website, emailController.value.text, slectSize.value);
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
  }

  void showDialogBoxOpen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            radius: 0,
            contentWidget: Form(
              key: formKey.value,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.transparent,
                    ),
                    Text(
                      LanguageConstants.specialSizeRequestsText.tr,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: double.maxFinite,
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: emailController.value,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.only(bottom: 12, top: 12, left: 10),
                      hintText: LanguageConstants.specialSizeEnterEmailText.tr,
                      hintStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                      labelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                      errorStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value == '') {
                        return LanguageConstants.enterEmailAddress.tr;
                      }
                      return '';
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15.6,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: sizeList
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: slectSize.toString() == ""
                            ? Text(
                                LanguageConstants.specialSizeSelectSizeText.tr,
                              )
                            : Text(
                                "$slectSize",
                                style: const TextStyle(color: Colors.black),
                              ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: Colors.black,
                        ),
                        iconEnabledColor: Colors.transparent,
                        onChanged: (String? value) {
                          slectSize.value = value!;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                InkWell(
                  onTap: () {
                    postSpecialSize(context, formKey);
                  },
                  child: Text(
                    LanguageConstants.specialSizeSubmitText.tr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ]),
            ),
          ),
        );
      },
    );
  }
}
