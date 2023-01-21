import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:suvandnat/app/controller/terms_condition/terms_condition_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class TeamsConditionScreen extends GetWidget<TeamsConditionController> {
  const TeamsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeamsConditionController controller = Get.find<TeamsConditionController>();

    return Obx(
      () => CommonBacground(
        child: Scaffold(
          drawerEnableOpenDragGesture: false,
          backgroundColor: Colors.transparent,
          appBar: commonAppbar(title: LanguageConstants.termsConditionsText.tr),
          drawer: const Drawer(),
          body: Column(
            children: [
              const SizedBox(height: 14.0),
              Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                          color: Color(0xFF973133),
                        ),
                      )
                    : controller.nodata.value
                        ? Center(
                            child: Text(controller.messageData.value),
                          )
                        : ListView.separated(
                          padding: EdgeInsets.all(24.w),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.transparent,
                                height: 0,
                                thickness: 1.2,
                              );
                            },
                            itemCount: controller
                                .teamsConditionList!.cmsText!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final teamsCondition = controller
                                  .teamsConditionList!.cmsText![index];
                              return ListTileTheme(
                                contentPadding: const EdgeInsets.all(0),
                                dense: true,
                                horizontalTitleGap: 0.0,
                                minLeadingWidth: 0,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    iconColor: Colors.black,
                                    collapsedIconColor: Colors.black,
                                    onExpansionChanged: (value) {
                                      controller.collepnseIcon[index] = value;
                                      debugPrint("value Is $value");
                                    },
                                    childrenPadding: EdgeInsets.zero,
                                    tilePadding: EdgeInsets.zero,
                                    title: Text(
                                      '${teamsCondition.title}',
                                      style: AppTextStyle.textStyleUtils400_16(),
                                    ),
                                    trailing: controller.collepnseIcon[index]
                                        ? const Icon(
                                            Icons.remove,
                                            size: 20,
                                          )
                                        : const Icon(
                                            Icons.add,
                                            size: 20,
                                          ),
                                    children: [
                                      teamsCondition.description == null
                                          ? Container()
                                          : Html(
                                              data:
                                                  teamsCondition.description)
                                    ],
                                  ),
                                ),
                              );
                            }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
