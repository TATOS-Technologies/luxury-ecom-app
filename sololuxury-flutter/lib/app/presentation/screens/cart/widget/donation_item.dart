import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/show_dialog.dart';

import '../../../../../all_imports.dart';

class DonationItem extends StatelessWidget {
  const DonationItem({Key? key, required this.itemData}) : super(key: key);
  final DonationItems itemData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemData.imageURL == null
              ?  Image(
                  image: AssetImage(AppAsset.he),
                )
              : Image.network(
                  itemData.imageURL ?? '',
                  height: 60,
                  fit: BoxFit.cover,
                ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LanguageConstants.cartContain3.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils600(
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CommonThemeButton(
                    onTap: () {
                      cartShowDialog(context);
                    },
                   title: 
                      controller.firstCapitalize(
                        LanguageConstants.cartContain4.tr,
                      ),
                     
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      );
    });
  }
}
