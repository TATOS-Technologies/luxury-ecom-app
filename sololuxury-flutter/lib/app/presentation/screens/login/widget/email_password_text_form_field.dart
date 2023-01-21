import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class EmailPasswordTextFormField extends StatelessWidget {
  const EmailPasswordTextFormField(
      {Key? key,
      required this.hintText,
      this.validation,
      required this.bottomPadding,
      required this.topPadding,
      this.controller})
      : super(key: key);

  final String hintText;
  final FormFieldValidator<String>? validation;
  final double bottomPadding;
  final double topPadding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 327.w,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontFamily: AppConstants.fontOpenSans,
              decoration: TextDecoration.none,
              decorationThickness: 0,
            ),
            validator: validation,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              filled: true,
              fillColor: appTileBGcolor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.only(
                bottom: bottomPadding,
                left: 12,
                top: topPadding,
              ),
              hintText: hintText,
              hintStyle: AppStyle.textStyleUtils400(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
