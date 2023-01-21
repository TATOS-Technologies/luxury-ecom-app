import '../../../../../all_imports.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer(
      {Key? key, required this.height, required this.imageUrl})
      : super(key: key);
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
      ),
    );
  }
}
