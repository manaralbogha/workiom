import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../logic/blok/register_cubit/cubit/register_cubit.dart';
import '../../../../logic/blok/register_cubit/cubit/register_state.dart';
import '../../../helpers/size_config.dart';
import '../../../widgets/space_widgets.dart';

class PasswordComplexity extends StatelessWidget {
  final int requiredLength;
  const PasswordComplexity({super.key, required this.requiredLength});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) => current is SetColorAndWidth,
        builder: (context, state) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.defaultSize * 1.1,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 2),
                      color: const Color.fromRGBO(244, 244, 244, 1),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: cubit.width,
                    height: SizeConfig.defaultSize * 1.1,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 2),
                      color: cubit.color,
                    ),
                  )
                ],
              ),
              const VerticalSpace(1),
              Row(
                children: [
                  SvgPicture.asset(
                    cubit.complexity == 4
                        ? "assets/svg/ok.svg"
                        : "assets/svg/not_enought_strong.svg",
                    width: SizeConfig.defaultSize * 1.8,
                  ),
                  const HorizontalSpace(1),
                  Text(
                    "Not enought strong",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.defaultSize * 1.8,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    cubit.passwordController.text.length >= requiredLength
                        ? "assets/svg/ok.svg"
                        : "assets/svg/x.svg",
                    width: SizeConfig.defaultSize * 1.5,
                  ),
                  const HorizontalSpace(1.4),
                  Text(
                    "Passwords must have at least ${requiredLength} characters",
                    style: TextStyle(
                      fontSize: SizeConfig.defaultSize * 1.4,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    cubit.passwordController.text.contains(RegExp(r'[A-Z]'))
                        ? "assets/svg/ok.svg"
                        : "assets/svg/x.svg",
                    width: SizeConfig.defaultSize * 1.5,
                  ),
                  const HorizontalSpace(1.4),
                  Text(
                    "Passwords must have at least one uppercase ('A'-'Z').",
                    style: TextStyle(
                      fontSize: SizeConfig.defaultSize * 1.4,
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
