import '../../../../../all_imports.dart';

class EmailSubscribe extends StatelessWidget {
  const EmailSubscribe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: appColor, width: 1.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: LanguageConstants.yourEmailText.tr,
                hintStyle: AppTextStyle.textStyleUtils400(
                    color: Colors.black54, size: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 47,
            width: 120,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(30),
              // border: Border.all(color: appColor, width: 1.5),
            ),
            alignment: Alignment.center,
            child: Text(
              LanguageConstants.subscribeText.tr,
              style: AppTextStyle.textStyleUtils400(
                  color: Colors.white, size: 13.5),
            ),
          ),
        ],
      ),
    );
  }
}
