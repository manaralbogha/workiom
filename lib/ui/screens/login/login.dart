import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/logic/core/app_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create Account Now?"),
                TextButton(
                    onPressed: () {
                      context.push(AppRouter.kRegisterView);
                    },
                    child: const Text("Sing Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
