import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/domain/models/password_complexity_model/password_complexity_model.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_cubit.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_state.dart';
import 'package:workiom/logic/core/app_router.dart';
import 'package:workiom/ui/helpers/size_config.dart';
import 'package:workiom/ui/screens/register/widgets/error.dart';
import 'package:workiom/ui/screens/register/widgets/password_complexity.dart';
import 'package:workiom/ui/screens/register/widgets/password_text_field.dart';
import 'package:workiom/ui/widgets/custom_button.dart';
import 'package:workiom/ui/widgets/custom_footer.dart';
import 'package:workiom/ui/widgets/custom_title.dart';
import 'package:workiom/ui/widgets/space_widgets.dart';

import '../../../domain/models/data_model/data_model.dart';
import '../../helpers/app_colors.dart';

import '../../widgets/custom_text_field.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    if (cubit.isOpen == false) {
      cubit.getPasswordComplexitySetting();
      cubit.isOpen = true;
    }

    return WillPopScope(
      onWillPop: () {
        cubit.isOpen = false;
        return Future.value(true);
        ;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                cubit.isOpen = false;
                context.pop();
              },
              child: const Icon(Icons.arrow_back_ios)),
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) =>
              current is! SetColorAndWidth && current is! LoginChangeSuffixIcon,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetPasswordComplexitySettingFailure) {
              return CustomError(cubit: cubit);
            }
            if (state is GetPasswordComplexitySettingSuccess) {
              cubit.passwordComplexity = state.passwordComplexity;
              return _UserInfoViewBody(
                cubit: cubit,
                id: id,
                passwordComplexity:
                    cubit.passwordComplexity as PasswordComplexityModel,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class _UserInfoViewBody extends StatelessWidget {
  const _UserInfoViewBody({
    super.key,
    required this.cubit,
    required this.passwordComplexity,
    required this.id,
  });
  final RegisterCubit cubit;
  final PasswordComplexityModel passwordComplexity;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKeyUser,
          child: Column(
            children: [
              const CustomTitle(title: "Enter a strong password"),
              const VerticalSpace(10),
              CustomTextField(
                controller: cubit.emailController,
                prefixIcon: SvgPicture.asset(
                  "assets/svg/email.svg",
                  width: SizeConfig.defaultSize * 2.2,
                ),
                suffixIcon: Icon(
                  Icons.cancel_outlined,
                  color: const Color.fromRGBO(116, 116, 116, 1),
                  size: SizeConfig.defaultSize * 2.3,
                ),
                hintText: "Email",
                labelText: "Your work email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'required';
                  } else {
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value.toString())) {
                      return "Please enter a valid email address";
                    }
                  }
                  return null;
                },
              ),
              const VerticalSpace(3),
              PasswordTextField(
                passwordComplexity: passwordComplexity,
              ),
              // CustomTextField(
              //   obscureText: cubit.obscureText,
              //   controller: cubit.passwordController,
              //   prefixIcon: SvgPicture.asset(
              //     "assets/svg/password.svg",
              //     width: SizeConfig.defaultSize * 1.8,
              //   ),
              //   suffixIcon: InkWell(
              //     onTap: () {
              //       cubit.changePasswordSuffixIcon();
              //     },
              //     child: Icon(
              //       cubit.passwordSuffixIcon,
              //       color: const Color.fromRGBO(116, 116, 116, 1),
              //       size: SizeConfig.defaultSize * 2.6,
              //     ),
              //   ),
              //   hintText: "Password",
              //   labelText: "Your password",
              //   keyboardType: TextInputType.visiblePassword,
              //   onChanged: (value) {
              //     cubit.getPasswordComplexity();
              //     log(cubit.complexity.toString());
              //   },
              //   validator: (value) {
              //     // log(passwordComplexity!.requireLowercase.toString());
              //     if (value?.isEmpty ?? true) {
              //       return 'required';
              //     } else {
              //       if (value!.length < passwordComplexity.requiredLength) {
              //         return "The password must be at least  characters long ";
              //       }
              //       if (passwordComplexity.requireDigit == true) {
              //         return value.contains(RegExp(r'[0-9]'))
              //             ? null
              //             : "The password must contain digits ";
              //       }
              //       if (passwordComplexity.requireLowercase == true) {
              //         return value.contains(RegExp(r'[a-z]'))
              //             ? null
              //             : "The password must contain lowercase ";
              //       }
              //       if (passwordComplexity.requireUppercase == true) {
              //         return value.contains(RegExp(r'[A-Z]'))
              //             ? null
              //             : "The password must contain uppercase ";
              //       }
              //     }
              //     return null;
              //   },
              // ),
              const VerticalSpace(3),
              PasswordComplexity(
                  requiredLength: passwordComplexity.requiredLength),
              const VerticalSpace(3),
              CustomButton(
                onTap: cubit.checkButtonUserCanClick()
                    ? () {
                        Data data = Data(
                          id: id,
                          emile: cubit.emailController.text,
                          password: cubit.passwordController.text,
                        );
                        if (cubit.formKeyUser.currentState!.validate()) {
                          context.push(AppRouter.kCompanyInfoView, extra: data);
                        }
                      }
                    : null,
                contentText: "Confirm password",
                color: cubit.checkButtonUserCanClick()
                    ? AppColors.secondaryColor
                    : Colors.grey,
              ),
              const VerticalSpace(12),
              const CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
