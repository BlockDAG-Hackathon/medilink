import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  
  final RxString userType = ''.obs;
  
  void setUserType(String type) {
    userType.value = type;
  }
  
  String getUserType() {
    return userType.value;
  }
  
  bool isDoctor() {
    return userType.value.toLowerCase() == 'doctor';
  }
  
  bool isPatient() {
    return userType.value.toLowerCase() == 'patient';
  }
  
  bool isEmergencyResponder() {
    return userType.value.toLowerCase() == 'emergency responder';
  }
}