import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_cubit.dart';
import 'package:workiom/logic/blok/register_cubit/cubit/register_state.dart';
import 'package:workiom/logic/core/app_router.dart';
import 'package:workiom/ui/helpers/custom_snack_bar.dart';
import 'package:workiom/ui/widgets/custom_button.dart';
import 'package:workiom/ui/widgets/custom_footer.dart';
import 'package:workiom/ui/widgets/custom_title.dart';

import '../../../domain/models/data_model/data_model.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/size_config.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/space_widgets.dart';

class CompanyInfoView extends StatelessWidget {
  const CompanyInfoView({super.key, required this.data});
  final Data data;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is IsTenantAvailableFailure ||
              state is RegisterTenantFailure) {
            CustomSnackBar.showErrorSnackBar(
              context,
              message: "Network error. Try again",
            );
          }
          if (state is IsTenantAvailableSuccess) {
            if (state.isTenantAvailable.stattenantIde == null) {
              cubit.registerTenant(
                adminEmailAddress: data.emile,
                adminFirstName: cubit.firstNameController.text,
                adminLastName: cubit.lastNameController.text,
                adminPassword: data.password,
                captchaResponse: null,
                editionId: data.id,
                name: cubit.tenantNameController.text,
                tenancyName: cubit.tenantNameController.text,
                timeZone: "Europe/Istanbul",
              );
            } else {
              CustomSnackBar.showErrorSnackBar(context,
                  message: "This company name taken by another tenant");
            }
          }
          if (state is RegisterTenantSuccess) {
            while (context.canPop()) {
              context.pop();
            }

            context.pushReplacement(AppRouter.kHomeView);
          }
        },
        builder: (context, state) {
          if (state is IsTenantAvailableLoading ||
              state is RegisterTenantLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _CompanyInfoViewBody(cubit: cubit);
        },
      ),
    );
  }
}

class _CompanyInfoViewBody extends StatelessWidget {
  const _CompanyInfoViewBody({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKeyCompany,
          child: Column(
            children: [
              const CustomTitle(title: "Enter your company name"),
              const VerticalSpace(10),
              CustomTextField(
                controller: cubit.tenantNameController,
                prefixIcon: SvgPicture.asset(
                  "assets/svg/workspace_name.svg",
                  width: SizeConfig.defaultSize * 2,
                ),
                suffixIcon: const Text(".workiom.com"),
                hintText: "Workspace name*",
                labelText: "Your company or team name",
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'required';
                  } else {
                    if (value![0].contains(RegExp(r'[A-Z]')) == false &&
                        value[0].contains(RegExp(r'[a-z]')) == false) {
                      return "Tenant names should start with a letter";
                    }
                  }
                  return null;
                },
              ),
              const VerticalSpace(3),
              CustomTextField(
                controller: cubit.firstNameController,
                prefixIcon: SvgPicture.asset(
                  "assets/svg/info.svg",
                  width: SizeConfig.defaultSize * 1.8,
                ),
                hintText: "Enter your First name",
                labelText: "Your first name",
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'required';
                  } else {
                    if (value!.contains(RegExp(r'[0-9]')) == true) {
                      return "It should be Letters only.";
                    }
                  }
                },
              ),
              const VerticalSpace(3),
              CustomTextField(
                controller: cubit.lastNameController,
                prefixIcon: SvgPicture.asset(
                  "assets/svg/info.svg",
                  width: SizeConfig.defaultSize * 1.8,
                ),
                hintText: "Enter your Last name",
                labelText: "Your last name",
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'required';
                  } else {
                    if (value!.contains(RegExp(r'[0-9]')) == true) {
                      return "It should be Letters only.";
                    }
                  }
                  return null;
                },
              ),
              const VerticalSpace(3),
              CustomButton(
                onTap: cubit.checkButtonCompanyCanClick()
                    ? () {
                        if (cubit.formKeyCompany.currentState!.validate()) {
                          cubit.isTenantAvailable(
                              tenantName: cubit.tenantNameController.text);
                        }
                      }
                    : null,
                contentText: "Confirm password",
                color: cubit.checkButtonCompanyCanClick()
                    ? AppColors.secondaryColor
                    : Colors.grey,
              ),
              const VerticalSpace(12),
              const CustomFooter()
            ],
          ),
        ),
      ),
    );
  }
}
