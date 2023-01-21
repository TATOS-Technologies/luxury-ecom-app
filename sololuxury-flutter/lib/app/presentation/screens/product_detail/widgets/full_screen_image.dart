import 'package:photo_view/photo_view.dart';

import '../../../../../all_imports.dart';

class FullScreenImage extends StatelessWidget {
  final String? imageUrl;
  final String? tag;

  const FullScreenImage({Key? key, this.imageUrl, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          //Hero => tag: tag!,
          Center(
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl!),
            ),
          ),
          GestureDetector(
            onTap: () => Get.back<dynamic>(),
            child: Container(
              height: 80,
              color: Colors.transparent,
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(
                top: 30,
                right: 30,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
