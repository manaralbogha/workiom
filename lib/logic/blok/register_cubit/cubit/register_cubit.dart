import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:workiom/domain/models/edition_model/edition_model.dart';

import 'package:workiom/logic/blok/register_cubit/cubit/register_state.dart';
import 'package:workiom/logic/repositories/register_repo/register_repo.dart';
import 'package:workiom/ui/helpers/size_config.dart';

import '../../../../domain/models/password_complexity_model/password_complexity_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  final RegisterRepo registerRepo;

  final formKeyUser = GlobalKey<FormState>();
  final formKeyCompany = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final tenantNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  PasswordComplexityModel? passwordComplexity;

  bool isOpen = false;
  bool obscureText = false;
  IconData passwordSuffixIcon = Icons.remove_red_eye;

  void changePasswordSuffixIcon() {
    if (passwordSuffixIcon == Icons.remove_red_eye_outlined) {
      passwordSuffixIcon = Icons.remove_red_eye_rounded;
    } else {
      passwordSuffixIcon = Icons.remove_red_eye_outlined;
    }
    obscureText = !obscureText;
    emit(LoginChangeSuffixIcon());
  }

  Future<void> getEditionsForSelect() async {
    emit(GetEditionsForSelectLoading());
    (await registerRepo.getEditionsForSelect()).fold(
      (failure) =>
          emit(GetEditionsForSelectFailure(errorMas: failure.errorMsg)),
      (editions) => emit(GetEditionsForSelectSuccess(editions: editions)),
    );
  }

  Future<void> getPasswordComplexitySetting() async {
    emit(GetPasswordComplexitySettingLoading());
    (await registerRepo.getPasswordComplexitySetting()).fold(
      (failure) => emit(
        GetPasswordComplexitySettingFailure(errorMas: failure.errorMsg),
      ),
      (passwordComplexitySetting) => emit(
        GetPasswordComplexitySettingSuccess(
            passwordComplexity: passwordComplexitySetting),
      ),
    );
  }

  Future<void> isTenantAvailable({required String tenantName}) async {
    emit(IsTenantAvailableLoading());
    (await registerRepo.isTenantAvailable(tenantName: tenantName)).fold(
      (failure) => emit(
        IsTenantAvailableFailure(errorMas: failure.errorMsg),
      ),
      (isTenantAvailable) => emit(
        IsTenantAvailableSuccess(isTenantAvailable: isTenantAvailable),
      ),
    );
  }

  Future<void> registerTenant({
    required String adminEmailAddress,
    required String adminFirstName,
    required String adminLastName,
    required String adminPassword,
    required String? captchaResponse,
    required int editionId,
    required String name,
    required String tenancyName,
    required String timeZone,
  }) async {
    emit(RegisterTenantLoading());
    (await registerRepo.registerTenant(
      adminEmailAddress: adminEmailAddress,
      adminFirstName: adminFirstName,
      adminLastName: adminLastName,
      adminPassword: adminPassword,
      captchaResponse: captchaResponse,
      editionId: editionId,
      name: name,
      tenancyName: tenancyName,
      timeZone: timeZone,
    ))
        .fold(
      (failure) => emit(
        RegisterTenantFailure(errorMas: failure.errorMsg),
      ),
      (registerTenant) => emit(
        RegisterTenantSuccess(registerTenant: registerTenant),
      ),
    );
  }

  bool checkButtonUserCanClick() {
    return emailController.text != "" && passwordController.text != "";
  }

  bool checkButtonCompanyCanClick() {
    return tenantNameController.text != "" &&
        firstNameController.text != "" &&
        lastNameController.text != "";
  }

  int complexity = 0;
  Color color = Colors.grey;
  double width = 0;
  int getPasswordComplexity() {
    complexity = 0;
    if (passwordController.text.length >= passwordComplexity!.requiredLength) {
      complexity++;
    }
    if (passwordController.text.contains(RegExp(r'[0-9]'))) {
      complexity++;
    }
    if (passwordController.text.contains(RegExp(r'[a-z]'))) {
      complexity++;
    }
    if (passwordController.text.contains(RegExp(r'[A-Z]'))) {
      complexity++;
    }
    setColorAndWidth();

    return complexity;
  }

  void setColorAndWidth() {
    if (complexity == 0) {
      color = Colors.grey;
      width = 0;
    }
    if (complexity == 1) {
      color = Colors.red;
      width = SizeConfig.screenWidth * .25;
    }
    if (complexity == 2) {
      color = Color.fromRGBO(245, 192, 68, 1);
      width = SizeConfig.screenWidth * .50;
    }
    if (complexity == 3) {
      color = Colors.orange;
      width = SizeConfig.screenWidth * .75;
    }
    if (complexity == 4) {
      color = Colors.green;
      width = SizeConfig.screenWidth;
    }

    emit(SetColorAndWidth());
  }
}
