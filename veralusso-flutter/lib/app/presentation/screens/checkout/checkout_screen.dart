import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/colors.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
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
        title: Image.asset("assets/images/logo 2.png"),
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
                          style: const TextStyle(
                              color: appColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          items: <String>[]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            LanguageConstants.unitedKingdomText.tr,
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w600),
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
                          style: const TextStyle(
                              color: appColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          items: <String>[]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: const Text(
                            "GBF",
                            style: TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w600),
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
                          style: const TextStyle(
                              color: appColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          items: <String>[]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            LanguageConstants.englishText.tr.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w600),
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
                    const Text("0", style: TextStyle(fontSize: 11))
                  ],
                )),
            const SizedBox(height: 30),
            Text(
              LanguageConstants.checkoutText.tr.toUpperCase(),
              style: const TextStyle(color: appColor, fontSize: 20),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Text(LanguageConstants.purchaseText.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: AppConstants.fontMontserrat,
                      fontSize: 14,
                      color: darkGrey,
                    ))),
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
                    Text(LanguageConstants.shippingAddressText.tr,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
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
                                hintText: LanguageConstants.emailAddressText.tr,
                                hintStyle: const TextStyle(fontSize: 14)),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(LanguageConstants.createCheckoutText.tr,
                            style: const TextStyle(fontSize: 10)),
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
                                    hintText:
                                        LanguageConstants.firstNameText.tr,
                                    hintStyle: const TextStyle(fontSize: 14)),
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
                                    hintText: LanguageConstants.lastNameText.tr,
                                    hintStyle: const TextStyle(fontSize: 14)),
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
                                hintText: LanguageConstants.companyText.tr,
                                hintStyle: const TextStyle(fontSize: 14)),
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
                                hintText: LanguageConstants.streetAdd1Text.tr,
                                hintStyle: const TextStyle(fontSize: 14)),
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
                                hintText: LanguageConstants.streetAdd2Text.tr,
                                hintStyle: const TextStyle(fontSize: 14)),
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
                                hintText: LanguageConstants.streetAdd3Text.tr,
                                hintStyle: const TextStyle(fontSize: 14)),
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
                                    hintText: LanguageConstants.cityHintText.tr,
                                    hintStyle: const TextStyle(fontSize: 14)),
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
                                    hintText:
                                        LanguageConstants.unitedKingdomText.tr,
                                    hintStyle: const TextStyle(fontSize: 14)),
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
                                      hintText:
                                          LanguageConstants.stateOrProvince.tr,
                                      hintStyle: const TextStyle(fontSize: 14)),
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
                                      hintText:
                                          LanguageConstants.zipCodeText.tr,
                                      hintStyle: const TextStyle(fontSize: 14)),
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
                                hintText: LanguageConstants.phoneNumberText.tr,
                                hintStyle: const TextStyle(fontSize: 14)),
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
                    Text(LanguageConstants.shippingMethodText.tr.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(color: appColor),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(LanguageConstants.price.tr,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            const Text(
                              "Rs 161,360.00",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Rs 161,360.00",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Title",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(
                              "Free",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Fixed",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Carrier Title",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(
                              "Free Shipping",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Standard Shipping",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
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
                    Text(LanguageConstants.paymentMethodText.tr.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(color: appColor),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Check/Money order",
                            style: TextStyle(fontSize: 12)),
                        Divider(),
                        Text("Cash On Delivery",
                            style: TextStyle(fontSize: 12)),
                        Divider(),
                        Text("Pay by Card with Checkout.com",
                            style: TextStyle(fontSize: 12))
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
                    Text(LanguageConstants.cartContain1.tr.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
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
                            Text(LanguageConstants.cartContain2.tr,
                                style: const TextStyle(fontSize: 13)),
                            const SizedBox(height: 5),
                            Text(LanguageConstants.cartContain3.tr,
                                style: const TextStyle(fontSize: 12)),
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
                    Text(LanguageConstants.orderSummaryText.tr,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const Divider(color: appColor),
                    const Text("1 Item in Cart",
                        style: TextStyle(fontSize: 14, color: silver)),
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
                          children: const [
                            Text(
                              "THE POUCH BAG",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Qty: 1",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rs 161,360.00",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "View Details",
                              style: TextStyle(fontSize: 12, color: lightGrey),
                            ),
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
                                    hintText: LanguageConstants
                                        .enterDiscountCodeText.tr,
                                    hintStyle: const TextStyle(
                                        color: darkGrey, fontSize: 14))),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: const BoxDecoration(color: appColor),
                            child: Center(
                              child: Text(LanguageConstants.applyFilterText.tr,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
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
                                children: const [
                                  Text(
                                    "Cart Subtotal",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Rs 161,360.00",
                                      style: TextStyle(fontSize: 14))
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguageConstants.shipping1Text.tr,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text("Rs 0.00",
                                      style: TextStyle(fontSize: 14))
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Firas Sample Shipping Method - Fixed",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguageConstants.orderTotalText.tr,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text("Rs 480.00",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: appColor)),
                                padding: const EdgeInsets.all(10),
                                child: TextFormField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: LanguageConstants
                                            .orderCommentText.tr,
                                        hintStyle: const TextStyle(
                                            fontSize: 14, color: darkGrey))),
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
                            child: Text(LanguageConstants.placeOrderText.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)))),
                    const SizedBox(height: 50)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
