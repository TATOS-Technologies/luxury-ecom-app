import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GuestReturnsController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  TextEditingController orderIdController = TextEditingController();
  TextEditingController billingLastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confrmEmailController = TextEditingController();
}
