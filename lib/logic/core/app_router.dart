import 'package:go_router/go_router.dart';

import 'package:workiom/ui/screens/home/home.dart';
import 'package:workiom/ui/screens/login/login.dart';

import '../../domain/models/data_model/data_model.dart';
import '../../ui/screens/register/company_info_view.dart';
import '../../ui/screens/register/register.dart';
import '../../ui/screens/register/user_info_view.dart';
import '../../ui/screens/splash/splash.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kHomeView = '/HomeView';
  static const kRegisterView = '/RegisterView';
  static const kUserInfoView = '/UserInfoView';
  static const kCompanyInfoView = '/CompanyInfoView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kUserInfoView,
        builder: (context, state) => UserInfoView(id: state.extra as int),
      ),
      GoRoute(
        path: kCompanyInfoView,
        builder: (context, state) => CompanyInfoView(data: state.extra as Data),
      ),
    ],
  );
}
