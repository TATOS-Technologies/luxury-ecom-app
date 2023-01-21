import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/faq/faq_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class FaqScreen extends GetView<FaqController> {
  @override
  final FaqController controller = Get.find();

  FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar: commonAppbar(title: LanguageConstants.faqText.tr),
        body: controller.loading.isTrue
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                ),
              )
            : pageView(),
      ),
    );
  }

  Widget pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getFaqList.length,
                // itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  debugPrint(
                      "DATADATA ========${controller.getFaqList[index].title.toString()}");
                  return ExpansionTil(
                    verticalVisualDensity: -1,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.getFaqList[index].title.toString(),
                        maxLines: 2,
                        style: AppTextStyle.textStyleUtils600(
                          size: 14.sp
                            ),
                      ),
                    ),
                    isIcon: controller.getFaqList.isEmpty ? true : false,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        child: Html(
                          data:
                              controller.getFaqList[index].description.toString(),
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
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<ExpansionTil>
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      margin: EdgeInsets.symmetric(vertical: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
          border: Border.all(
        color: textFieldBoarderColor,
        width: 2
      )),
      child: Column(
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
      ),
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
