import '../../../../../all_imports.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: backGroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.textDonationText.tr,
                      style: AppTextStyle.textStyleUtils700(
                        color: appColor,
                        size: 16,
                      ).copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        LanguageConstants.e5Text.tr,
                        style: AppTextStyle.textStyleUtils500(color: appColor),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        LanguageConstants.e10Text.tr,
                        style: AppTextStyle.textStyleUtils500(color: appColor),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        LanguageConstants.e15Text.tr,
                        style: AppTextStyle.textStyleUtils500(color: appColor),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        LanguageConstants.e20Text.tr,
                        style: AppTextStyle.textStyleUtils500(color: appColor),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        LanguageConstants.e25Text.tr,
                        style: AppTextStyle.textStyleUtils500(color: appColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  LanguageConstants.chooseYourownText.tr,
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        color: appColor,
                        alignment: Alignment.center,
                        child: Text(
                          LanguageConstants.gbpText.tr,
                          style:
                              AppTextStyle.textStyleUtils500(color: appColor),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            cursorColor: appColor,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: const EdgeInsets.only(
                                    bottom: 10, top: 10, left: 10),
                                hintText: "",
                                labelStyle: AppTextStyle.textStyleUtils400(
                                    color: Colors.black54),
                                errorStyle: AppTextStyle.textStyleUtils400(
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(color: appColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                    color: appColor,
                                    width: 1.0,
                                  ),
                                ),
                                suffixIcon: null,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: appColor,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  LanguageConstants.theSelectamountText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25), color: appColor),
                  child: Text(
                    LanguageConstants.iwanttoDonateText.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils400(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                        ),
                      ]),
                  child: const CircleAvatar(
                    radius: 18.0,
                    backgroundColor: backGroundColor,
                    child: Icon(Icons.close, color: appColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
