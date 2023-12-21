import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_cubit.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_state.dart';

import '../../../../domain/models/password_complexity_model/password_complexity_model.dart';
import '../../../helpers/size_config.dart';
import '../../../widgets/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, required this.passwordComplexity});
  final PasswordComplexityModel passwordComplexity;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);

    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) => current is LoginChangeSuffixIcon,
        builder: (context, state) {
          return CustomTextField(
            obscureText: cubit.obscureText,
            controller: cubit.passwordController,
            prefixIcon: SvgPicture.asset(
              "assets/svg/password.svg",
              width: SizeConfig.defaultSize * 1.8,
            ),
            suffixIcon: InkWell(
              onTap: () {
                cubit.changePasswordSuffixIcon();
              },
              child: Icon(
                cubit.passwordSuffixIcon,
                color: const Color.fromRGBO(116, 116, 116, 1),
                size: SizeConfig.defaultSize * 2.6,
              ),
            ),
            hintText: "Password",
            labelText: "Your password",
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              cubit.getPasswordComplexity();
            },
            validator: (value) {
              // log(passwordComplexity!.requireLowercase.toString());
              if (value?.isEmpty ?? true) {
                return 'required';
              } else {
                if (value!.length < passwordComplexity.requiredLength) {
                  return "The password must be at least  characters long ";
                }
                if (passwordComplexity.requireDigit == true) {
                  return value.contains(RegExp(r'[0-9]'))
                      ? null
                      : "The password must contain digits ";
                }
                if (passwordComplexity.requireLowercase == true) {
                  return value.contains(RegExp(r'[a-z]'))
                      ? null
                      : "The password must contain lowercase ";
                }
                if (passwordComplexity.requireUppercase == true) {
                  return value.contains(RegExp(r'[A-Z]'))
                      ? null
                      : "The password must contain uppercase ";
                }
              }
              return null;
            },
          );
        });
  }
}
