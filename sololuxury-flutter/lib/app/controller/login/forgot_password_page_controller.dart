import 'package:solo_luxury/all_imports.dart';

class ForgotPasswordPageController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<String> forgotpasswordResponseModel = "".obs;
}
