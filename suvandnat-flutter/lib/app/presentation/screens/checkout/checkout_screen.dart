import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Icon(Icons.ac_unit),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: Image.asset("assets/images/logo home2.png"),
        centerTitle: true,
        iconTheme: const IconThemeData(color: appColor),
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: offWhite,
                          value: _chosenValue,
                          // elevation: 0,
                          style:
                          AppTextStyle.textStyleUtils600(color: appColor),
                          items: <String>[]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "United Kingdom",
                            style: AppTextStyle.textStyleUtils600(size: 9),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: offWhite,
                          value: _chosenValue,
                          // elevation: 0,
                          style:
                          AppTextStyle.textStyleUtils600(color: appColor),
                          items: <String>[]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "GBF",
                            style: AppTextStyle.textStyleUtils600(size: 9),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: offWhite,
                          value: _chosenValue,
                          // elevation: 0,
                          style:
                          AppTextStyle.textStyleUtils600(color: appColor),
                          items: <String>[]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "ENGLISH",
                            style: AppTextStyle.textStyleUtils600(size: 9),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const Icon(Icons.search),
                    Image.asset("assets/images/heart.png"),
                    const Icon(Icons.shopping_bag_rounded),
                    Text(
                      "0",
                      style: AppTextStyle.textStyleUtils400(size: 11)
                    )
                  ],
                )),
            const SizedBox(height: 30),
            Text(
              "CHECKOUT",
              style: AppTextStyle.textStyleUtils400(size: 20, color: appColor),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                    "Please Enter Your Details Below To Complete Your Purchase",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(color: darkGrey))),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor)),
                child: Column(
                  children: [
                    Text("SHIPPING ADDRESS",
                        style: AppTextStyle.textStyleUtils700_16()),
                    const Divider(color: appColor),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: appColor),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: "Email Address",
                                hintStyle: AppTextStyle.textStyleUtils400()),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text("You can create an account after checkout.",
                            style: AppTextStyle.textStyleUtils400(size: 10)),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 155,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: appColor),
                                  borderRadius: BorderRadius.circular(1)),
                              child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "First Name",
                                    hintStyle:
                                    AppTextStyle.textStyleUtils400()),
                              ),
                            ),
                            Container(
                              width: 155,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: appColor),
                                  borderRadius: BorderRadius.circular(1)),
                              child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "Last Name",
                                    hintStyle:
                                    AppTextStyle.textStyleUtils400()),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: appColor),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: "Company",
                                hintStyle: AppTextStyle.textStyleUtils400()),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: appColor),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: "Street Address",
                                hintStyle: AppTextStyle.textStyleUtils400()),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: appColor),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: "Street Address2",
                                hintStyle: AppTextStyle.textStyleUtils400()),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: appColor),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: "Street Address3",
                                hintStyle: AppTextStyle.textStyleUtils400()),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 155,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: appColor),
                                  borderRadius: BorderRadius.circular(1)),
                              child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "City",
                                    hintStyle:
                                    AppTextStyle.textStyleUtils400()),
                              ),
                            ),
                            Container(
                              width: 155,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: appColor),
                                  borderRadius: BorderRadius.circular(1)),
                              child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "United Kingdom",
                                    hintStyle:
                                    AppTextStyle.textStyleUtils400()),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 155,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(width: 1, color: appColor),
                                    borderRadius: BorderRadius.circular(1)),
                                child: TextFormField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: "State/Province",
                                      hintStyle:
                                      AppTextStyle.textStyleUtils400()),
                                ),
                              ),
                              Container(
                                width: 155,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(width: 1, color: appColor),
                                    borderRadius: BorderRadius.circular(1)),
                                child: TextFormField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Zip/Postal Code",
                                      hintStyle:
                                      AppTextStyle.textStyleUtils400()),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: appColor),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: "Phone Number",
                                hintStyle: AppTextStyle.textStyleUtils400()),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor)),
                child: Column(
                  children: [
                    Text("SHIPPING METHOD",
                        style: AppTextStyle.textStyleUtils700_16()),
                    const Divider(color: appColor),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Price",
                                style:
                                AppTextStyle.textStyleUtils700(size: 14)),
                            const SizedBox(height: 5),
                            Text(
                              "Rs 161,360.00",
                              style: AppTextStyle.textStyleUtils400_12(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Rs 161,360.00",
                              style: AppTextStyle.textStyleUtils400_12(),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Title",
                                style:
                                AppTextStyle.textStyleUtils700(size: 14)),
                            const SizedBox(height: 5),
                            Text(
                              "Free",
                              style: AppTextStyle.textStyleUtils400_12(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Fixed",
                              style: AppTextStyle.textStyleUtils400_12(),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Carrier Title",
                                style:
                                AppTextStyle.textStyleUtils700(size: 14)),
                            const SizedBox(height: 5),
                            Text(
                              "Free Shipping",
                              style: AppTextStyle.textStyleUtils400_12(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Standard Shipping",
                              style: AppTextStyle.textStyleUtils400_12(),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor)),
                child: Column(
                  children: [
                    Text("PAYMENT METHOD",
                        style: AppTextStyle.textStyleUtils700_16()),
                    const Divider(color: appColor),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Check/Money order",
                            style: AppTextStyle.textStyleUtils400_12()),
                        const Divider(),
                        Text("Cash On Delivery",
                            style: AppTextStyle.textStyleUtils400_12()),
                        const Divider(),
                        Text("Pay by Card with Checkout.com",
                            style: AppTextStyle.textStyleUtils400_12())
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor)),
                child: Column(
                  children: [
                    Text("SUPPORT A CHARITY WITH YOUR DONATION",
                        style: AppTextStyle.textStyleUtils700_16()),
                    const Divider(color: appColor),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                            width: 90,
                            height: 60,
                            decoration:
                            const BoxDecoration(color: Colors.white)),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                "15% Of The Order Value Will\n Be Donated By Avoirchic For\n Donation",
                                style:
                                AppTextStyle.textStyleUtils400(size: 13)),
                            const SizedBox(height: 5),
                            Text("PLEASE CLICK HERE TO DONATE\n NOW",
                                style: AppTextStyle.textStyleUtils400_12()),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor)),
                child: Column(
                  children: [
                    Text("ORDER SUMMARY",
                        style: AppTextStyle.textStyleUtils700_16()),
                    const Divider(color: appColor),
                    Text("1 Item in Cart",
                        style: AppTextStyle.textStyleUtils400(color: silver)),
                    const Divider(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                            width: 150,
                            height: 100,
                            decoration:
                            const BoxDecoration(color: Colors.white)),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "THE POUCH BAG",
                              style: AppTextStyle.textStyleUtils700(size: 13),
                            ),
                            Text(
                              "Qty: 1",
                              style: AppTextStyle.textStyleUtils700_12(),
                            ),
                            Text(
                              "Rs 161,360.00",
                              style: AppTextStyle.textStyleUtils700_12(),
                            ),
                            Text("View Details",
                                style: AppTextStyle.textStyleUtils400_12(
                                    color: lightGrey)),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: appColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 220,
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                decoration: InputDecoration.collapsed(
                                    hintText: "ENTER DISCOUNT CODE",
                                    hintStyle: AppTextStyle.textStyleUtils400(
                                        color: lightGrey))),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: const BoxDecoration(color: appColor),
                            child: Center(
                              child: Text("APPLY",
                                  style: AppTextStyle.textStyleUtils400_16(
                                      color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Cart Subtotal",
                                      style: AppTextStyle.textStyleUtils700(
                                          color: Colors.white)),
                                  Text("Rs 161,360.00",
                                      style: AppTextStyle.textStyleUtils400())
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping",
                                    style: AppTextStyle.textStyleUtils700(),
                                  ),
                                  Text("Rs 0.00",
                                      style: AppTextStyle.textStyleUtils400())
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Firas Sample Shipping Method - Fixed",
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order Total",
                                    style: AppTextStyle.textStyleUtils700(),
                                  ),
                                  Text("Rs 480.00",
                                      style: AppTextStyle.textStyleUtils700())
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: appColor)),
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Order Comment",
                                        hintStyle:
                                        AppTextStyle.textStyleUtils400(
                                            color: darkGrey))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        decoration: const BoxDecoration(color: appColor),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: Center(
                            child: Text("PLACE ORDER",
                                style: AppTextStyle.textStyleUtils700_16(
                                    color: Colors.white)))),
                    const SizedBox(height: 50)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
