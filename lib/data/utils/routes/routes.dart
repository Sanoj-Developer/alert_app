import 'package:get/get.dart';
import 'package:khatri_alter/view/login/login_view.dart';
import 'package:khatri_alter/view/login/sign_in.dart';
import 'package:khatri_alter/view/registration_form/registration_form_view.dart';
import 'package:khatri_alter/view/sign_up/sign_up_view.dart';
import 'package:khatri_alter/view/splash/splash_view.dart';
import 'package:khatri_alter/view/test_login/test_sign_up.dart';

class Routes {
  static const initial = '/';
  static const login = '/login';
  static const signUp = '/signUp';
  static const registrationForm = '/registration';

  static final List<GetPage> pages = [
    GetPage(name: initial, page: () => const SplashView()),
    GetPage(name: login, page: () => SignInView()),
    GetPage(name: signUp, page: () => const SignUpView()),
    GetPage(name: registrationForm, page: () => const RegistrationFormView()),
  ];
}
