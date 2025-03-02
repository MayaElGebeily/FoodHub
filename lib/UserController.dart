import 'package:get/get.dart';

class UserController extends GetxController {
  var fullName = ''.obs;

  void setFullName(String name) {
    fullName.value = name;
  }
}