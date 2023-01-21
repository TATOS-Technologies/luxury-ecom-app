import 'dart:ui';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'common_widget/common_message/internet_error.dart';

class Circle {
  static final _instance = Circle.internal();

  factory Circle() => _instance;

  Circle.internal();

  static bool entry = false;
  static OverlayEntry viewEntry = OverlayEntry(
    builder: (BuildContext context) {
      return const ProcessIndicator();
    },
  );

  InternetError internetError = InternetError();

  Future<void> show(BuildContext context) async {
    return addOverlayEntry(context);
  }

  void hide(context) => removeOverlay();

  bool get isShow => isShowNetworkOrCircle();

  bool isShowNetworkOrCircle() {
    return internetError.isShow || entry == true;
  }

  Future<void> addOverlayEntry(BuildContext context) async {
    if (entry == true) return;
    entry = true;
    return addOverlay(viewEntry, context);
  }

  Future<void> addOverlay(OverlayEntry entry, BuildContext context) async {
    try {
      return Overlay.of(context)?.insert(entry);
    } catch (e) {
      return Future.error(e);
    }
  }

  void removeOverlay() async {
    try {
      entry = false;
      viewEntry.remove();
    } catch (e) {
      return Future.error(e);
    }
  }
}

class ProcessIndicator extends StatelessWidget {
  const ProcessIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          // color: Colors.transparent,
          child: const CircularProgressIndicator(
            strokeWidth: 3,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
