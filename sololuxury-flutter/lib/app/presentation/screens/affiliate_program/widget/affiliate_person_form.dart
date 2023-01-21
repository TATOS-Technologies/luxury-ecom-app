import 'package:solo_luxury/app/presentation/screens/affiliate_program/widget/profile_part.dart';

import '../../../../../all_imports.dart';
import 'address_part.dart';

class AffiliatePersonForm extends StatelessWidget {
  final AffiliateProgramController controller;

  const AffiliatePersonForm({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey.value,
            child: Container(
              decoration: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  color: controller.backColor.value,
                  shadows: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 5.0,
                        spreadRadius: 3.0),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const ProfilePart(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const AddressPart(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CommonButton(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      buttonType: ButtonType.elevatedButton,
                      onPressed: () {
                        controller.submitButton();
                      },
                      elevation: 0.0,
                      color: appColorButton,
                      borderRadius: 20.0,
                      child: CommonTextPoppins(LanguageConstants.submitText.tr,
                          style: AppTextStyle.textStyleUtils500(
                              size: 14, color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
