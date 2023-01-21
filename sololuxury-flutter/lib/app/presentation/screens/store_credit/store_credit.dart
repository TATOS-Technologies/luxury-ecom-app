import 'package:meta_package/api/models/store_credit/store_credit_model.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/store_credit/widgets/store_credit_list_item.dart';

class StoreCreditScreen extends GetView<StoreCreditController> {
  const StoreCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        drawerEnableOpenDragGesture: false,
        appBar: commonAppbar(
          title: LanguageConstants.storeCreditText.tr,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: controller.shoopingbiling.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: appColor,
                      ),
                    )
                  : controller.nodata.value
                      ? Center(
                          child: Text(controller.messageData.value),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: controller.getStoreCreditList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              StoreCreditModel? storeData =
                                  controller.getStoreCreditList?[index];
                              return StoreCreditListItem(storeData);
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
