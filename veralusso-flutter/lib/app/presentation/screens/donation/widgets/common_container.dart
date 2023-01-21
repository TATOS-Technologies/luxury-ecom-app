import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonContainer extends StatelessWidget {
  final double? height;
  final String imageUrl;

  const CommonContainer({Key? key,required this.height, required this.imageUrl}) : super(key: key);

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
