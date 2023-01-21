import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/error_widget/error_data_widget.dart';

class ExceptionHandler {
  static void apiExceptionError(
      {required ApiException e,
      ValueChanged<String>? callBack,
      bool? showAlert}) {
    Validators.apiExceptionError(
        e: e,
        showAlert: showAlert,
        callBack: callBack,
        errorAlert: (String value) {
          return ErrorDataWidget(
            error: value,
          );
        });
  }

  static void appCatchError({required dynamic error}) {
    Validators.appCatchError(
        error: error,
        errorAlert: (String value) {
          return ErrorDataWidget(
            error: value,
          );
        });
  }
}
