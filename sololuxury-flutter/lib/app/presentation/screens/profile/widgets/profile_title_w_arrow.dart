// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../all_imports.dart';

class ProfileTitleWithArrow extends GetView<ProfileController> {
  final String? title;
  final VoidCallback? onTap;
  const ProfileTitleWithArrow({this.title, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextOpenSans(
              title ?? "",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
            SizedBox(
              height: 18.0,
              width: 18.0,
              child: Center(
                child: SvgPicture.asset(
                  AppAsset.rightIcon,
                  height: 10.0,
                  width: 10.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
