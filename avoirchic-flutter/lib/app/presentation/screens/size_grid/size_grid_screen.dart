import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';

class SizeGuidPage extends StatefulWidget {
  const SizeGuidPage({Key? key}) : super(key: key);

  @override
  State<SizeGuidPage> createState() => _SizeGuidPageState();
}

class _SizeGuidPageState extends State<SizeGuidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(color: lightBrownColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SIZE GUIDE",
                          style: AppTextStyle.textStyleUtils400_16(
                              color: brownColor),
                        ),
                        const Icon(
                          Icons.close,
                          color: brownColor,
                        )
                      ],
                    )),
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                        width: 80,
                        height: 32.17,
                        child: Image.asset("assets/images/shoe.png")),
                    const SizedBox(width: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "BALENCIAGA",
                            style: AppTextStyle.textStyleUtils400_16(
                                color: brownColor),
                          ),
                          Text("LOAFERS IN LEATHER",
                              style: AppTextStyle.textStyleUtils400_12(
                                  color: darkGrey)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.stop, color: brownColor),
                              Text("Fit Predictor ",
                                  style: AppTextStyle.textStyleUtils400_12(
                                      color: darkGrey)),
                              Text("Calculate Your Size",
                                  style: AppTextStyle.textStyleUtils400_12(
                                      color: darkGrey)),
                            ],
                          )
                        ])
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("CONVERSION CHART",
                    style: AppTextStyle.textStyleUtils400(
                        size: 24, color: brownColor)),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("US", style: AppTextStyle.textStyleUtils400_16()),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Standard",
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 15, color: lightGrey)),
                              const Icon(Icons.arrow_drop_down)
                            ]),
                      )
                    ],
                  ),
                ),
                sizeGridItem("0", "XXXS"),
                sizeGridItem("2", "XXS"),
                sizeGridItem("4", "XS"),
                sizeGridItem("6", "S"),
                sizeGridItem("8", "M"),
                sizeGridItem("10", "L"),
                sizeGridItem("12", "XL"),
                sizeGridItem("14", "XXL"),
                sizeGridItem("16", "XXXL"),
                sizeGridItem("18", "4XL"),
                sizeGridItem("20", "5XL"),
                sizeGridItem("22", "6XL"),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Text(
                    "Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch.",
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          )),
    );
  }

  Widget sizeGridItem(String quantiy, String size) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Row(children: [
        Text(quantiy, style: AppTextStyle.textStyleUtils700_16()),
        const Spacer(),
        Text(size,
            style: AppTextStyle.textStyleUtils400(color: lightGrey, size: 15)),
        const Icon(Icons.arrow_drop_down)
      ]),
    );
  }
}
