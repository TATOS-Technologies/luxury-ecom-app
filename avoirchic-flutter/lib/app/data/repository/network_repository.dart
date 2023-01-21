import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();
  static final dataStorage = GetStorage();

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  // StreamController gameDetailStream = new StreamController
  //     .broadcast(); // for stream builder - to add data in stramCiontroller
//Login
//   userLogin(context, authUserData) async {
//     try {
//       final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//         context: context,
//         url: '',
//         data: authUserData,
//       );
//       return checkResponse(authUserResponse);
//     } catch (e) {
//       CommonMethod().getXSnackBar("Error", e.toString(), red);
//     }
//   }

  //
  // addAddress(context, addAddress) async {
  //   try {
  //     final authUserResponse = await NetworkDioHttp.putDioHttpMethod(
  //       context: context,
  //       url: '${AppConstants.apiEndPoint}${AppConstants.addAddress}',
  //       data: addAddress,
  //     );
  //     return checkResponse(authUserResponse);
  //   } catch (e) {
  //     CommonMethod().getXSnackBar("Error", e.toString(), red);
  //   }
  // }

  // Future countryList() async {
  //   String url = '${AppConstants.apiEndPoint}${AppConstants.countryList}';
  //   debugPrint("url -> $url");
  //   http.Response response = await http.get(
  //     Uri.parse(url),
  //   );
  //   debugPrint("response.statusCode -> ");
  //   debugPrint('${response.statusCode}');
  //   if (response.statusCode == 200) {
  //     var parsedJson = await json.decode(response.body);
  //     debugPrint("Files Is $parsedJson");
  //     return List<CountryListModel>.from(
  //         parsedJson.map((country) => CountryListModel.fromJson(country)));
  //   }
  // }
  // Image upload
  // Future uploadImage({context, selectedImage, uploadType}) async {
  //   String url = '${AppConstants.apiEndPoint}/upload/compress/$uploadType';
  //   var request = http.MultipartRequest(
  //     "POST",
  //     Uri.parse("$url"),
  //   );

  //   final token = await NetworkDioHttp.getHeaders();
  //   request.headers.addAll(token);
  //   request.files.add(
  //       await http.MultipartFile.fromPath("image", selectedImage.toString()));
  //   if (context != null) Circle().show(context);
  //   var response = await request.send();

  //   var responseData = await response.stream.toBytes();
  //   var responseString = String.fromCharCodes(responseData);
  //   var parsedJson = await json.decode(responseString);

  //   if (context != null) Circle().hide(context);
  //   if (response.statusCode == 200) {
  //     return UpdateImageModel.fromJson(parsedJson);
  //   } else {
  //     return '';
  //   }
  // }

  // Future<void> checkResponse(
  //   response,
  // ) async {
  //   if (response["error_description"] == null ||
  //       response["error_description"] == 'null') {
  //     if (response['body']['status'] == 200 ||
  //         response['body']['status'] == "200") {
  //       return response;
  //     } else if (response['body']['status'] == 500 ||
  //         response['body']['status'] == "500") {
  //       return response;
  //     } else {
  //       showErrorDialog(message: response['body']['message']);
  //     }
  //   } else {
  //     if (response['body']['status'] == 401 ||
  //         response['body']['status'] == '401') {
  //       showErrorDialog(message: response['body']['message']);
  //       Future.delayed(const Duration(seconds: 2), () {
  //         Get.to(const LoginScreen());
  //       });
  //     } else {
  //       showErrorDialog(message: response['body']['message']);
  //     }
  //   }
  // }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), red);
  }
}

//  final authUserData = {
//           "old_token": dataStorage.read('token').toString(),
//           "refresh_token": dataStorage.read('refreshToken').toString(),
//         };
//         debugPrint(authUserData);
//         // GenerateTokenModel authResponse =
//         //     await generateToken(context, authUserData);

//         final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
//           context: context,
//           url: '${AppConstants.apiEndPoint}${AppConstants.generateToken}',
//           data: authUserData,
//         );
//         debugPrint('-----------------------$authUserResponse');
//         GenerateTokenModel responseData =
//             GenerateTokenModel.fromJson(authUserResponse['body']);
//         if (responseData.status == 200) {
//           dataStorage.write('token', responseData.data?.token);
//           dataStorage.write('refreshToken', responseData.data?.refreshToken);
//           SuccessDialog.showSuccessDialog(
//             successMessage: responseData.message.toString(),
//             onPressed: () {
//               Get.offAll(LoginScreen());
//             },
//           );
//         }
