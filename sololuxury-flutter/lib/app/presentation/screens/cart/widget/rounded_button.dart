import '../../../../../all_imports.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.padding,
      required this.margin})
      : super(key: key);
  final String title;
  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: appColor,
        ),
        child: Text(title,
            style: AppTextStyle.textStyleUtils400(color: Colors.white)),
      ),
    );
  }
}
