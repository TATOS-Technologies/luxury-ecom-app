import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/special_size_api_repository.dart';

class SpecialSizeRequestController extends GetxController {
  final emailController = TextEditingController().obs;
  final sizeController = TextEditingController().obs;
  var slectSize = "".obs;

  List<String> sizeList = ["1", "2", "3", "4"];

  SpecialSizeAPIRepository specialSizeAPIRepository =
      SpecialSizeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;
  final formKey = GlobalKey<FormState>().obs;

  SpecialSizeRequestController({this.countryCode});

  Future<void> postSpecialSize(context, formKey) async {
    try {
      const website = "www.brands-labels.com";
      await specialSizeAPIRepository.postSpecialSizeApiResponse(
          website, emailController.value.text, slectSize.value);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  //getShow Dialog
  void showDialogBoxOpen(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(() => CommonAlertDialog(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                contentWidget: SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: Form(
                    key: formKey.value,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(LanguageConstants.specialSizeText.tr,
                              style: const TextStyle(
                                  color: Color(0xff000080),
                                  fontWeight: FontWeight.w600)),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.close,
                                size: 22,
                                color: Color(0xff000080),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: const Color(0xff000080),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          controller: emailController.value,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  bottom: 12, top: 12, left: 10),
                              hintText: LanguageConstants.enterEmail.tr,
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              errorStyle: const TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: const BorderSide(
                                  color: Color(0xff000080),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: const BorderSide(
                                  color: Color(0xff000080),
                                  width: 1.0,
                                ),
                              ),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff000080),
                                  ),
                                  borderRadius: BorderRadius.circular(0.0))),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Enter Email";
                            }
                            return null;
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                            border: Border.all(
                                color: const Color(0xff000080), width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: sizeList
                                  .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      ))
                                  .toList(),
                              isExpanded: true,
                              hint: slectSize.toString() == ""
                                  ? Text(
                                      LanguageConstants
                                          .specialSizeSelectSizeText.tr,
                                    )
                                  : Text(
                                      "$slectSize",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 22,
                                color: Colors.black45,
                              ),
                              iconEnabledColor: Colors.transparent,
                              onChanged: (String? value) {
                                slectSize.value = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      InkWell(
                        onTap: () {
                          postSpecialSize(context, formKey);
                        },
                        child: Text(
                          LanguageConstants.submitText.tr,
                          style: const TextStyle(
                              color: Color(0xff000080),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ]),
                  ),
                ),
              ));
        });
  }
}
