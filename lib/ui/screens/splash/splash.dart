import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:workiom/logic/core/app_router.dart';
import 'package:workiom/logic/repositories/splash_repo/splash_repo_impl.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ViewBody(),
    );
  }
}

class ViewBody extends StatefulWidget {
  const ViewBody({super.key});

  @override
  State<ViewBody> createState() => _ViewBodeState();
}

class _ViewBodeState extends State<ViewBody> {
  @override
  void initState() {
    _navigateToNextView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  void _navigateToNextView() async {
    (await SplashRepoImpl().getCurrentLoginInformation(token: ""))
        .fold((failure) => context.pushReplacement(AppRouter.kLoginView),
            (loginInfoModel) {
      if (loginInfoModel.user == null) {
        context.pushReplacement(AppRouter.kLoginView);
      } else {
        context.pushReplacement(AppRouter.kHomeView);
      }
    });
  }
}
