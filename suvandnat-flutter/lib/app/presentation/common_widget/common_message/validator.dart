import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/helper/error_handling_helper.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/presentation/common_widget/error_widget/error_data_widget.dart';

class Validators {
  static void apiResponseMessage(
      {String? body,
      success = false,
      message,
      isDecode = true,
      Color color = Colors.red}) {
    try {
      debugPrint("body['message'] -> $body && ${body.runtimeType} && $message");
      debugPrint("response['message'] -> $message");
      if (body?.isNotEmpty == true) {
        Map response = (body == null)
            ? {}
            : jsonDecode(body.toString()) as Map<String, dynamic>;
        if (response.isNotEmpty && response['message'] != null) {
          Get.snackbar(LanguageConstants.alert.tr, "${response['message']}",
              colorText: color);
        }
      } else {
        Get.snackbar(LanguageConstants.alert.tr, "$message", colorText: color);
      }
    } catch (e) {
      debugPrint('Debug error ---$e  === ${e is FormatException}');
      appCatchError(error: e);
    }
  }

  static void apiExceptionError(
      {required ApiException e,
      Color color = Colors.red,
      ValueChanged<String>? callBack,
      bool? showAlert}) async {
    debugPrint("Error ['message'] -> ${e.message}   ${e.error}");
    debugPrint('error msg type alert--- $showAlert');
    String errorMsg = '';
    if (e.error is DioError) {
      DioError data = e.error as DioError;
      debugPrint('error msg type--- ${data.type}');
      errorMsg = await ErrorHandlingHelper.handleDioError(data);
    } else if (e.error is ApiException) {
      debugPrint(
          "Error APIEXCEPTION ['message'] -> ${(e.error as ApiException).error}   ${e.error}");
      ApiException error = e.error as ApiException;
      // to handle apiexception
      apiExceptionError(e: error);
    } else if (e.error is HttpException) {
      // to handle http exception
      HttpException data = e.error as HttpException;
      errorMsg = await ErrorHandlingHelper.handleHttpException(data);
    } else if (e.error is FormatException) {
      // to handle format exception
      FormatException data = e.error as FormatException;
      errorMsg = await ErrorHandlingHelper.handleFormatException(data);
    } else {
      errorMsg = await ErrorHandlingHelper.handleFlutterError(e);
    }

    if (showAlert ?? true) {
      Get.dialog(ErrorDataWidget(error: errorMsg));
    }

    if (callBack != null) {
      callBack(errorMsg);
    }
  }

  static void appCatchError(
      {required dynamic error, Color color = Colors.red}) async {
    debugPrint("Error ['message'] -> $error");
    String errorMsg = '';
    if (error is DioError) {
      debugPrint('error msg type--- ${error.type}');
      errorMsg = await ErrorHandlingHelper.handleDioError(error);
    } else if (error is ApiException) {
      debugPrint("Error APIEXCEPTION ['message'] -> ${(error).error}   $error");
      // to handle apiexception
      apiExceptionError(e: error);
    } else if (error is HttpException) {
      // to handle http exception
      errorMsg = await ErrorHandlingHelper.handleHttpException(error);
    } else if (error is FormatException) {
      // to handle format exception
      errorMsg = await ErrorHandlingHelper.handleFormatException(error);
    } else {
      errorMsg = await ErrorHandlingHelper.handleFlutterError(error);
    }

    Get.dialog(ErrorDataWidget(error: errorMsg));
  }

  static String? validateDigits(String value, String type, int length) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "$type is Required";
    } else if (value.length != length) {
      return "$type must be of $length digits";
    } else if (!regExp.hasMatch(value)) {
      return "$type must be a number. Example: 100";
    }
    return null;
  }

  static String? validateAmount(int? value, String type, String type2) {
    if (value == null || value < 10) {
      return type;
    } else if (value > 200) {
      return type2;
    } else {
      return null;
    }
  }

  static String? validateCharacter(String value, String type, int length) {
    String patttern = r'(^[a-zA-Z0-9]{8,16}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "$type is Required";
    } else if (value.length != length) {
      return "$type must be of $length character";
    } else if (!regExp.hasMatch(value)) {
      return "$type is invalid!";
    }
    return null;
  }

  static String? validateRequired(String value, String type) {
    if (value.isEmpty) {
      return "$type ${LanguageConstants.requiredVal.tr}";
    }
    return null;
  }

  static String? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // String patttern = r'(^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4,5})$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "Phone number is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number is not valid";
    }
    return null;
  }

  String? validateGSTNumber(String value) {
    String pattern =
        r'(^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$)';

    RegExp regExp = RegExp(pattern);
    if (value.isNotEmpty && !regExp.hasMatch(value)) {
      return "GST Identification Number is not valid. It should be in this 11AAAAA1111Z1A1 format";
    }

    return null;
  }

  //For Email Verification we using RegEx.
  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return LanguageConstants.emailAddressRequired.tr;
    } else if (!regExp.hasMatch(value)) {
      return LanguageConstants.invalidEmail.tr;
    } else {
      return null;
    }
  }

  static String? validateName(String? value, String type) {
    String pattern = r'^[a-zA-Z ]{2,50}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.length < 3) {
      return "$type ${LanguageConstants.mustBeMoreTham2Char.tr}";
    } else if (!regExp.hasMatch(value)) {
      return "${LanguageConstants.entervalid.tr} $type";
    } else {
      return null;
    }
  }

  static final RegExp _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$');

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LanguageConstants.passwordIsRequired.tr;
    } else if (!_passwordRegex.hasMatch(value)) {
      return LanguageConstants.passwordRegExp.tr;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null && value?.isEmpty == true) {
      return LanguageConstants.passwordIsRequired.tr;
    } else if (!_passwordRegex.hasMatch(value.toString())) {
      return "Invalid";
    } else if (value != password) {
      return LanguageConstants.confirmpasswordshouldbematchwithpassword.tr;
    } else {
      return null;
    }
  }
}
