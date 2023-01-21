// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';

import '../../../controller/special_request/special_request_controller.dart';
import 'widgets/special_request_fielsds.dart';
import 'widgets/submit_account_button.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  SpecialRequestScreen({Key? key}) : super(key: key);
  @override
  final SpecialRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(controller.getHeader()),
      ),
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.5,
                vertical: 12.5,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameTextField(),
                      const SizedBox(
                        height: 10,
                      ),
                      LastNameField(),
                      const SizedBox(
                        height: 10,
                      ),
                      EmailField(),
                      const SizedBox(
                        height: 10,
                      ),
                      PhoneNumberField(),
                      const SizedBox(
                        height: 10,
                      ),
                      BrandNameField(),
                      const SizedBox(
                        height: 10,
                      ),
                      StyleField(),
                      const SizedBox(
                        height: 10,
                      ),
                      KeywordField(),
                      const SizedBox(
                        height: 10,
                      ),
                      ImageUrlField(),
                      const SizedBox(
                        height: 10,
                      ),
                      RemarkField(),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SubmitAccountButton(),
                      ),
                    ],
                  ),
                ),
              )),
          Obx(() => controller.isSubmitButtonPressed.value
              ? const ScreenLoading()
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
