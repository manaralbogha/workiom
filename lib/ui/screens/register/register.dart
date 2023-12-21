import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_cubit.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_state.dart';
import 'package:workiom/logic/core/app_router.dart';
import 'package:workiom/ui/helpers/app_colors.dart';
import 'package:workiom/ui/helpers/size_config.dart';

import '../../helpers/custom_snack_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_footer.dart';
import '../../widgets/custom_title.dart';
import '../../widgets/space_widgets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            InkWell(child: Icon(Icons.arrow_back_ios)),
            Text(
              "Sing in",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
      body: const _RegisterViewBody(),
    );
  }
}

class _RegisterViewBody extends StatelessWidget {
  const _RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is GetEditionsForSelectSuccess) {
          context.push(AppRouter.kUserInfoView, extra: state.editions[0].id);
          //  log(state.editions[0].id.toString());
        }
        if (state is GetEditionsForSelectFailure) {
          CustomSnackBar.showErrorSnackBar(
            context,
            message: "Something wrong please try agin",
          );
        }
      },
      builder: (context, state) {
        // if (state is GetEditionsForSelectLoading) {
        //   return Container(
        //     width: SizeConfig.screenWidth,
        //     height: SizeConfig.screenHeight,
        //     color: Colors.transparent,
        //     child: const Center(child: CircularProgressIndicator()),
        //   );
        // }
        return Container(
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTitle(
                  title: "Create your free account",
                ),
                const VerticalSpace(15),
                CustomButton(
                  onTap: () {},
                  color: const Color.fromRGBO(244, 244, 244, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/google.svg", width: 16),
                      const HorizontalSpace(1),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.defaultSize * 1.9,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.defaultSize * 3.5,
                  ),
                  child: const Center(child: Text("Or")),
                ),
                CustomButton(
                  onTap: () {
                    cubit.getEditionsForSelect();
                  },
                  color: AppColors.secondaryColor,
                  contentText: "Continue with email",
                ),
                const VerticalSpace(1.5),
                Center(
                  child: SvgPicture.asset(
                    "assets/svg/text.svg",
                    width: SizeConfig.screenWidth * .75,
                  ),
                ),
                const VerticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/languageLogo.svg",
                      width: SizeConfig.defaultSize * 1.9,
                    ),
                    const HorizontalSpace(1.1),
                    const Text("English"),
                    const Icon(
                      Icons.arrow_drop_down,
                    )
                  ],
                ),
                const VerticalSpace(2),
                const CustomFooter()
              ],
            ),
          ),
        );
      },
    );
  }
}
