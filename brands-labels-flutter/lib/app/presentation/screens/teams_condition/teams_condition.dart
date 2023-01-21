// import 'package:brandslabels/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/teams_condition_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TeamsConditionScreen extends GetView<TeamsConditionController> {
  const TeamsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeamsConditionController controller = Get.find<TeamsConditionController>();
    return Obx(
      () => Scaffold(
        appBar: commonAppbar(title: LanguageConstants.termsConditionsText.tr),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xff000080),
                ),
              )
            : controller.nodata.value
                ? Center(child: Text(controller.messageData.value))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      itemCount: controller.teamsConditionList?.cmsText?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final teamsCondition = controller.teamsConditionList?.cmsText?[index];
                        return ListTileTheme(
                          contentPadding: const EdgeInsets.all(0),
                          dense: true,
                          horizontalTitleGap: 0.0,
                          minLeadingWidth: 0,
                          child: Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                                '${teamsCondition?.title}',
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                              trailing:
                                  controller.collepnseIcon[index] ? const Icon(Icons.remove) : const Icon(Icons.add),
                              children: [
                                teamsCondition?.description == null
                                    ? Container()
                                    : Html(data: "${teamsCondition?.description}")
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
