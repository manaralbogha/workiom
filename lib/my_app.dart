import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_cubit.dart';
import 'package:workiom/logic/core/app_router.dart';
import 'package:workiom/logic/repositories/register_repo/register_repo_impl.dart';
import 'package:workiom/ui/helpers/app_colors.dart';
import 'package:workiom/ui/helpers/size_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => RegisterCubit(registerRepo: RegisterRepoImpl()),
      child: MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme:
                AppBarTheme(foregroundColor: AppColors.secondaryColor)),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
