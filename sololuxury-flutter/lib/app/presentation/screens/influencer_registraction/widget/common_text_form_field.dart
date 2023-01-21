import '../../../../../all_imports.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField(
      {Key? key,
      required this.hintText,
      required this.height,
      this.validation,
      required this.bottomPadding,
      required this.topPadding,
      this.controller})
      : super(key: key);
  final String hintText;
  final double height;
  final FormFieldValidator<String>? validation;
  final double bottomPadding;
  final double topPadding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        fontFamily: AppConstants.fontOpenSans,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      validator: validation,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: appTileColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.circular(12)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
        hintStyle: subTextStyle(),
      ),
    );
  }

  TextStyle subTextStyle({Color? color}) {
    return TextStyle(
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: color ?? Colors.grey,
    );
  }
}
