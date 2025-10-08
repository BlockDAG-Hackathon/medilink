import 'package:get/get.dart';

class Utils {
  static final width = Get.width;
  static final height = Get.height;

  // onboarding data
  static final List<dynamic> onboarding = [
    {
      "image": "assets/ui/welcome.png",
      "title": "Welcome to BlockDAG",
      "desc":
          "Securely store, share, and protect your personal records with blockchain-grade security. You decide who gets access - and when",
    },
    {
      "image": "assets/ui/guard.png",
      "title": "Privacy You Can Trust",
      "desc":
          "Your records are encrypted end-to-end. Only you and the people you authorize can unlock them. No one else - not even us - can see your data",
    },
    {
      "image": "assets/ui/RedCross.png",
      "title": "Help When It Matters Most",
      "desc":
          "In an emergency, first responders can request secure, time-limited access to your critical information - like blood type and allergies - so you get the right care fast",
    },
    {
      "image": "assets/ui/last.png",
      "title": "Secure and Seamless Data sharing",
      "desc":
          "Protect your record with end-to-end encryption and share them instantly with only the people you trust",
    },
  ];

  // phrase checks
  static final List<String> phraseChecks = [
    "BlockDAG do not keep a copy of your secret phrase",
    "Saving this digitally is not recommended e.g screenshots, text files or emailing yourself",
    "Write down your secret phrase, and store it in a secure offline location!",
  ];

  // secret phrases
  static final List<Map<String, dynamic>> secretPhrases = List.generate(
    5, // Length of the list
    (index) => {'id': index, 'title': 'Item '},
  );
  static final List<Map<String, dynamic>> completionsData = [
    {
      "title": "Login Successful",
      "desc": "Your account has been verified. \n Welcome back, Ultra",
      "label": "Continue using BlockDAG",
    },
    {
      "title": "Welcome aboard",
      "desc":
          "Your account is now ready to use. Dive and start your medical journey. Stay safe!",
      "label": "Start using BlockDAG",
    },
  ];
}
