//Add To Cart Open Dialog3
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../../../../all_imports.dart';

void addNewDialog(
  BuildContext context,
  AddAddressPopUpController controller,
) {
  showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) {
      return CommonAlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: const Color(0xffFBECE5),
        contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  LanguageConstants.shippingAddressText.tr,
                  style: const TextStyle(
                      color: appColor, decoration: TextDecoration.underline, fontWeight: FontWeight.w500, fontSize: 18),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.clear,
                    color: appColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    // width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.firstNameText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterFirstName.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    width: 140,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.lastNameText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterLastName.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.addressOneText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterStreetAddress.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.cityText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterCity.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.addressTwoText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterStreetAddress.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Container(
                    height: 40.0,
                    padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: appColor.withOpacity(0.6), width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: controller.countryList
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        isExpanded: true,
                        hint: controller.selectedCoutry.value == ""
                            ? Text(
                                LanguageConstants.country.tr,
                                style: const TextStyle(
                                    color: appColor, fontSize: 14),
                              )
                            : Text(
                                controller.selectedCoutry.value.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: appColor.withOpacity(0.6),
                        ),
                        onChanged: (String? value) {
                          controller.selectedCoutry.value = value!;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.streetAddress3.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterStreetAddress.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.stateText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterStateProvince.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.zipPostalText.tr,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterZipPostalCode.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
                        hintText: LanguageConstants.phoneNumberText,
                        hintStyle: const TextStyle(color: appColor, fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        isDense: true,
                        suffixIcon: null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: appColor.withOpacity(0.6),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterPhoneNumber.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.saveAddressBook.value = 0;
                  },
                  child: Container(
                    height: 18,
                    width: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all(color: appColor)),
                    child: controller.saveAddressBook.value == 1
                        ? const Icon(
                            Icons.check,
                            color: appColor,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  LanguageConstants.saveInAddressBookText.tr,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: appColor.withOpacity(0.6)),
                    foregroundColor: appColor.withOpacity(0.6),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    LanguageConstants.shipHereText.tr,
                    style: const TextStyle(color: appColor),
                  ),
                ),
                const SizedBox(width: 10.0),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: appColor.withOpacity(0.6)),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    LanguageConstants.cancelText.tr,
                    style: const TextStyle(color: appColor),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
