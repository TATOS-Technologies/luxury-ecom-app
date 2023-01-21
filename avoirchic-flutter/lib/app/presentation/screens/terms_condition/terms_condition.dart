import 'package:avoirchic/app/controller/terms_condition_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class TeamsConditionScreen extends GetView<TeamsConditionController> {
  const TeamsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeamsConditionController controller = Get.find<TeamsConditionController>();
    controller.update();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(LanguageConstants.tearmsAndCondition.tr),
        ),
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              key: controller.scaffoldKey.value,
              body: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff367587),
                      ),
                    )
                  : controller.nodata.value
                      ? Center(
                          child: Text(controller.messageData.value),
                        )
                      : Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              if (controller.teamsConditionList != null &&
                                  controller.teamsConditionList?.cmsText
                                          ?.isNotEmpty ==
                                      true)
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        separatorBuilder: (context, index) {
                                          return const Divider(
                                            color: Colors.transparent,
                                            height: 0,
                                            thickness: 1.2,
                                          );
                                        },
                                        itemCount: controller
                                            .teamsConditionList!
                                            .cmsText!
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final teamsCondition = controller
                                              .teamsConditionList!
                                              .cmsText![index];
                                          return ListTileTheme(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            dense: true,
                                            horizontalTitleGap: 0.0,
                                            minLeadingWidth: 0,
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: ExpansionTile(
                                                iconColor: Colors.black,
                                                collapsedIconColor:
                                                    Colors.black,
                                                onExpansionChanged: (value) {
                                                  debugPrint("value Is $value");

                                                  controller.collepnseIcon[
                                                      index] = value;
                                                },
                                                childrenPadding:
                                                    EdgeInsets.zero,
                                                tilePadding: EdgeInsets.zero,
                                                title: Text(
                                                  '${teamsCondition.title}',
                                                  style: AppTextStyle
                                                      .textStyleUtils400_16(),
                                                ),
                                                trailing: controller
                                                        .collepnseIcon[index]
                                                    ? const Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                      )
                                                    : const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                      ),
                                                children: [
                                                  teamsCondition.description ==
                                                          null
                                                      ? Container()
                                                      : Html(
                                                          data:
                                                              "${teamsCondition.description}")
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
