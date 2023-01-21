import 'package:flutter/material.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class SizeGuidPage extends StatefulWidget {
  const SizeGuidPage({Key? key}) : super(key: key);

  @override
  SizeGuidPageState createState() => SizeGuidPageState();
}

class SizeGuidPageState extends State<SizeGuidPage> {
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
                          style:
                              AppStyle.textStyleUtils400_16(color: brownColor),
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
                            style: AppStyle.textStyleUtils400_16(
                                color: brownColor),
                          ),
                          Text("LOAFERS IN LEATHER",
                              style: AppStyle.textStyleUtils400_12(
                                  color: darkGrey)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.stop, color: brownColor),
                              Text("Fit Predictor ",
                                  style: AppStyle.textStyleUtils400_12(
                                      color: darkGrey)),
                              Text(
                                "Calculate Your Size",
                                style: AppStyle.textStyleUtils400_12(
                                    color: darkGrey),
                              )
                            ],
                          )
                        ])
                  ],
                ),
                const SizedBox(height: 30),
                const Text("CONVERSION CHART",
                    style: TextStyle(color: brownColor, fontSize: 24)),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "US",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Standard",
                                  style: TextStyle(
                                      fontSize: 15, color: lightGrey)),
                              Icon(Icons.arrow_drop_down)
                            ]),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("0",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXXS",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("2",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXS",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("4",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XS",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("6",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("S", style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("8",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("M", style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("10",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("L", style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("12",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("14",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("16",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXXL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("18",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("4XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("20",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("5XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: const [
                    Text("22",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("6XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: const Text(
                    "Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          )),
    );
  }
}
