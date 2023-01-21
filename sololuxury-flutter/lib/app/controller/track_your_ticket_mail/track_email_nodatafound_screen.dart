import 'package:solo_luxury/all_imports.dart';

class TrackYourTicketNoDataFound extends StatelessWidget {
  const TrackYourTicketNoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants
                  .weCannotFindAnyRequestAssociatedWithThisEmail.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: AppConstants.fontOpenSans,
                  color: Colors.black,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LanguageConstants.pleaseTryWithAnotherEmailAddress.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: AppConstants.fontOpenSans,
                  color: Colors.black,
                  fontSize: 14),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAndToNamed<dynamic>(RoutesConstants.dashboardScreen);
              },
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: appColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: CommonTextOpenSans(
                LanguageConstants.continueShopping.tr,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
