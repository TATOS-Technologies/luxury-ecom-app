import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

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
            margin: const EdgeInsets.only(
              top: 13.0,
              right: 8.0,
            ),
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
                        size: 14.sp,
                        color: appColor,
                      ).copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.w
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            LanguageConstants.e5Text.tr,
                            style: AppTextStyle.textStyleUtils500(color: appColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Container(
                        
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.w
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            LanguageConstants.e10Text.tr,
                            style: AppTextStyle.textStyleUtils500(color: appColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Container(
                        
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.w
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            LanguageConstants.e15Text.tr,
                            style: AppTextStyle.textStyleUtils500(color: appColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Container(
                        
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.w
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            LanguageConstants.e20Text.tr,
                            style: AppTextStyle.textStyleUtils500(color: appColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Container(
                        
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.w
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            LanguageConstants.e25Text.tr,
                            style: AppTextStyle.textStyleUtils500(color: appColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  LanguageConstants.chooseYourownText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                       
                        color: appColor,
                        alignment: Alignment.center,
                        child: Text(
                          LanguageConstants.gbpText.tr,
                          style: AppTextStyle.textStyleUtils500(
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            cursorColor: appColor,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                bottom: 10,
                                top: 10,
                                left: 10,
                              ),
                              hintText: "",
                              labelStyle: const TextStyle(
                                color: Colors.black54,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  0.0,
                                ),
                                borderSide: const BorderSide(
                                  color: appColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  0.0,
                                ),
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
                                borderRadius: BorderRadius.circular(
                                  0.0,
                                ),
                              ),
                            ),
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
                CommonThemeButton(
                  title: LanguageConstants.iwanttoDonateText.tr.toUpperCase(),
                 
                  onTap: () {},
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
