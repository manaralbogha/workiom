import 'package:equatable/equatable.dart';
import 'package:workiom/domain/models/edition_model/edition_model.dart';
import 'package:workiom/domain/models/is_tenant_available_model/is_tenant_available_model.dart';
import 'package:workiom/domain/models/password_complexity_model/password_complexity_model.dart';

import '../../../../domain/models/register_tenant_model/register_tenant_model.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class GetEditionsForSelectLoading extends RegisterState {}

final class GetEditionsForSelectSuccess extends RegisterState {
  final List<EditionModel> editions;

  GetEditionsForSelectSuccess({required this.editions});
}

final class GetEditionsForSelectFailure extends RegisterState {
  final String errorMas;

  GetEditionsForSelectFailure({required this.errorMas});
}

final class GetPasswordComplexitySettingLoading extends RegisterState {}

final class GetPasswordComplexitySettingSuccess extends RegisterState {
  final PasswordComplexityModel passwordComplexity;

  GetPasswordComplexitySettingSuccess({required this.passwordComplexity});
}

final class GetPasswordComplexitySettingFailure extends RegisterState {
  final String errorMas;

  GetPasswordComplexitySettingFailure({required this.errorMas});
}

final class IsTenantAvailableLoading extends RegisterState {}

final class IsTenantAvailableSuccess extends RegisterState {
  final IsTenantAvailableModel isTenantAvailable;

  IsTenantAvailableSuccess({required this.isTenantAvailable});
}

final class IsTenantAvailableFailure extends RegisterState {
  final String errorMas;

  IsTenantAvailableFailure({required this.errorMas});
}

final class RegisterTenantLoading extends RegisterState {}

final class RegisterTenantSuccess extends RegisterState {
  final RegisterTenantModel registerTenant;

  RegisterTenantSuccess({required this.registerTenant});
}

final class RegisterTenantFailure extends RegisterState {
  final String errorMas;

  RegisterTenantFailure({required this.errorMas});
}

final class SetColorAndWidth extends RegisterState {}

final class LoginChangeSuffixIcon extends RegisterState {}
