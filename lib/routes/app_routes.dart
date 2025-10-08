import 'package:get/get.dart';
import 'package:hackathon_app/controllers/splash_controllers.dart';
import 'package:hackathon_app/pages/home/home.dart';
import 'package:hackathon_app/pages/auth/auth.dart';
import 'package:hackathon_app/pages/auth/passphrase/completed_auth.dart';
import 'package:hackathon_app/pages/auth/passphrase/confirm_backup.dart';
import 'package:hackathon_app/pages/auth/passphrase/confirm_seed_phrases.dart';
import 'package:hackathon_app/pages/auth/passphrase/generate_phrases.dart';
import 'package:hackathon_app/pages/auth/passphrase/secret_phrase_intro.dart';
import 'package:hackathon_app/pages/auth/signup/signup.dart';
import 'package:hackathon_app/pages/auth/splash.dart';
import 'package:hackathon_app/pages/details.dart';
import 'package:hackathon_app/pages/auth/login.dart';
import 'package:hackathon_app/pages/auth/create_password.dart';
import 'package:hackathon_app/pages/onboarding.dart';
import 'package:hackathon_app/pages/auth/signup/signup_options.dart';

class AppPages {
  static const initial = '/'; // Set initial route to a known path
  static const home = '/home';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const signupOptions = '/signup-options';
  static const details = '/details/:id';
  static const auth = '/auth';
  static const createPassword = '/create-password';
  static const passphrase = '/passphrase/backup';
  static const confirmBackup = '/passphrase/backup/confirm';
  static const generatePassphrase = '/passphrase/generate-passphrase';
  static const confirmPhrase = '/passphrase/confirm-passphrase';
  static const completeWalletAuth = '/passphrase/complete-auth';
  static final List<GetPage> routes = [
    // Correctly reference the static route names from RoutePaths
    GetPage(
      name: initial,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      // Optional: Add a transition for flair
      transition: Transition.fadeIn,
    ),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(name: signup, page: () => SignupScreen()),
    GetPage(name: signupOptions, page: () => SignupOptionsScreen()),
    // Example of a route with a dynamic path parameter
    GetPage(name: details, page: () => const DetailsScreen()),
    GetPage(name: auth, page: () => const AuthScreen()),
    GetPage(name: passphrase, page: () => NewWalletScreen()),
    GetPage(name: confirmBackup, page: () => SecretPhraseIntroScreen()),
    GetPage(name: generatePassphrase, page: () => GeneratePhrasesScreen()),
    GetPage(name: confirmPhrase, page: () => ConfirmSeedPhrasesScreen()),
    GetPage(name: completeWalletAuth, page: () => CompletedAuthScreen()),
    GetPage(name: createPassword, page: () => CreatePasswordScreen()),
  ];
}
