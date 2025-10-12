import 'package:get/get.dart';

class SignupController extends GetxController {
  // Step management
  final activeIndex = 0.obs;
  
  // Form fields - Personal Info
  final fullName = ''.obs;
  final dateOfBirth = ''.obs;
  final contactInfo = ''.obs;
  final selectedGender = 'Select'.obs;
  
  // Form fields - Medical Info
  final selectedBloodGroup = 'Select'.obs;
  final allergies = ''.obs;
  final existingConditions = ''.obs;
  final emergencyContact = ''.obs;
  
  // Consent
  final termsAccepted = false.obs;
  
  // Dropdown options
  final List<String> genders = [
    'Select', 
    'Male', 
    'Female', 
    'Other',
  ];
  
  final List<String> bloodGroups = [
    'Select',
    'A+', 'A-', 'B+', 'B-', 
    'AB+', 'AB-', 'O+', 'O-'
  ];
  
  // Navigation methods
  void nextStep() {
    if (activeIndex.value < 2) {
      activeIndex.value++;
    }
  }
  
  void previousStep() {
    if (activeIndex.value > 0) {
      activeIndex.value--;
    }
  }
  
  void goToStep(int step) {
    if (step >= 0 && step <= 2) {
      activeIndex.value = step;
    }
  }
  
  // Form validation
  bool isCurrentStepValid() {
    switch (activeIndex.value) {
      case 0:
        return true; // Welcome step is always valid
      case 1:
        return selectedBloodGroup.value != 'Select' && 
               emergencyContact.value.isNotEmpty;
      case 2:
        return fullName.value.isNotEmpty && 
               dateOfBirth.value.isNotEmpty &&
               selectedGender.value != 'Select' &&
               contactInfo.value.isNotEmpty;
      default:
        return false;
    }
  }
  
  // Reset form
  void resetForm() {
    activeIndex.value = 0;
    fullName.value = '';
    dateOfBirth.value = '';
    contactInfo.value = '';
    selectedGender.value = 'Select';
    selectedBloodGroup.value = 'Select';
    allergies.value = '';
    existingConditions.value = '';
    emergencyContact.value = '';
  }
}
