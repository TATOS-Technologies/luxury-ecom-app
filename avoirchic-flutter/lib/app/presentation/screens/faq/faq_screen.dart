import 'package:avoirchic/app/controller/faq_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class FaqScreen extends GetView<FaqController> {
  FaqScreen({Key? key}) : super(key: key);

  final name = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            LanguageConstants.freuentlyAskedQueText.tr,
          ),
          elevation: 0,
        ),
        body: Stack(
          children: [
            controller.loading.isTrue
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: appBorderColor,
                    ),
                  )
                : pageView(),
          ],
        ),
      ),
    );
  }

  Widget pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        // color: appColorAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35.h,
                        child: TextField(
                          controller: controller.feqText,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.only(top: 23, left: 15),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderGrey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: borderGrey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: borderGrey, width: 1.0),
                                  borderRadius: BorderRadius.circular(12)),
                              counterText: '',
                              prefixIconConstraints: const BoxConstraints(
                                minHeight: 18,
                                minWidth: 46,
                              ),
                              hintText: "Faq",
                              filled: true,
                              fillColor: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 35.w,
                      child: CommonThemeButton(
                          onTap: () {
                            controller.getFaqList.refresh();
                            highlightText();
                          },
                          title: LanguageConstants.highlightText.tr),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.getFaqList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    debugPrint(
                        "DATADATA ========${controller.getFaqList[index].title.toString()}");
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTil(
                        verticalVisualDensity: -1,
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 20),
                        title: Text(
                            controller.getFaqList[index].title
                                .toString()
                                .toUpperCase(),
                            style: AppTextStyle.textStyleUtils400(size: 18)),
                        isIcon: controller.getFaqList.isEmpty ? true : false,
                        children: [
                          Container(
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Html(
                              data: controller.getFaqList[index].description
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void highlightText() {
    for (int i = 0; i < controller.getFaqList.length; i++) {
      controller.getFaqList[i].description = controller
          .getFaqList[i].description
          .toString()
          .replaceAll("<span style='background-color:yellow'>", "");
      controller.getFaqList[i].description = controller
          .getFaqList[i].description
          .toString()
          .replaceAll("</span>", "");

      String temp = controller.getFaqList[i].description!;

      int startValue = 0;
      int index = -1;
      String serchtext = controller.feqText.text.trim();
      if (serchtext.isNotEmpty) {
        do {
          index =
              temp.toUpperCase().indexOf(serchtext.toUpperCase(), startValue);
          if (index != -1) {
            String substring = temp.substring(index, index + serchtext.length);
            String changeHtml =
                "<span style='background-color:yellow'>$substring</span>";
            temp =
                temp.replaceRange(index, index + serchtext.length, changeHtml);
            startValue = index + changeHtml.length - serchtext.length;
          }
        } while (index != -1);
        controller.getFaqList[i].description = temp;
      }
    }
  }
}

class ExpansionTil extends StatefulWidget {
  const ExpansionTil({
    Key? key,
    this.contentPadding,
    this.verticalVisualDensity = 0.0,
    this.isIcon = false,
    this.iconColor = blackColor,
    this.tileHeight,
    this.leading,
    @required this.title,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
  })  : assert(initiallyExpanded != null),
        super(key: key);

  final Widget? leading;
  final bool isIcon;
  final Color iconColor;
  final Widget? title;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget>? children;
  final double? tileHeight;
  final EdgeInsetsGeometry? contentPadding;
  final double verticalVisualDensity;
  final Widget? trailing;
  final bool? initiallyExpanded;

  @override
  ExpansionTileState createState() => ExpansionTileState();
}

class ExpansionTileState extends State<ExpansionTil>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _controller;
  late Animation<double?> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);

    _isExpanded = (PageStorage.of(context)?.readState(context) ??
        (widget.initiallyExpanded ?? false)) as bool;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(_isExpanded);
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: widget.tileHeight,
          child: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: ListTile(
              visualDensity: VisualDensity(
                  horizontal: 0, vertical: widget.verticalVisualDensity),
              minVerticalPadding: 0,
              contentPadding: widget.contentPadding,
              dense: true,
              onTap: _handleTap,
              leading: widget.leading,
              title: widget.title,
              trailing: widget.trailing ??
                  RotationTransition(
                    turns: _controller.drive(_halfTween.chain(_easeInTween)),
                    child: widget.isIcon
                        ? Container(
                            color: Colors.transparent,
                            width: 1,
                          )
                        : Icon(
                            _isExpanded ? Icons.remove : Icons.add,
                            color: widget.iconColor,
                            size: 20,
                          ),
                  ),
            ),
          ),
        ),
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children!),
    );
  }
}
