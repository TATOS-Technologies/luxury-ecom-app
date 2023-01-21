import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/faq_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../theme/app_text_style.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        body: controller.getFaqList.isEmpty ? Container() : pageView(),
      ),
    );
  }

  Widget pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: Get.height,
        width: Get.width,
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 110,
              ),
              Text(LanguageConstants.faqTitle.tr,
                  style: AppTextStyle.textStyleUtilsUnderLine20(
                      fontWeight: FontWeight.w400, thickness: 1)),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getFaqList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  debugPrint(
                      "DATADATA ========${controller.getFaqList[index].title.toString()}");
                  return ExpansionTil(
                    tileHeight: 40,
                    verticalVisualDensity: -1,
                    contentPadding: const EdgeInsets.only(left: 10, right: 20),
                    title: Text(
                      controller.getFaqList[index].title.toString(),
                      style: AppTextStyle.textStyleUtils400_16(
                        color: darkBlue2A2B9B,
                      ),
                    ),
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTil extends StatefulWidget {
  const ExpansionTil({
    Key? key,
    this.contentPadding,
    this.verticalVisualDensity = 0.0,
    this.isIcon = false,
    this.iconColor = darkBlue2A2B9B,
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
        (widget.initiallyExpanded ?? bool)) as bool;
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
                        : Image.asset(
                            _isExpanded ? AppAsset.minus : AppAsset.plus,
                            height: 14,
                            color: widget.iconColor,
                            width: 14,
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
