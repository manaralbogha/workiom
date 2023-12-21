import 'package:dartz/dartz.dart';
import 'package:workiom/domain/models/edition_model/edition_model.dart';
import 'package:workiom/domain/models/is_tenant_available_model/is_tenant_available_model.dart';
import 'package:workiom/domain/models/password_complexity_model/password_complexity_model.dart';
import 'package:workiom/logic/repositories/splash_repo/splash_repo.dart';

import '../../../domain/models/register_tenant_model/register_tenant_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, List<EditionModel>>> getEditionsForSelect();
  Future<Either<Failure, PasswordComplexityModel>>
      getPasswordComplexitySetting();
  Future<Either<Failure, IsTenantAvailableModel>> isTenantAvailable(
      {required String tenantName});
  Future<Either<Failure, RegisterTenantModel>> registerTenant({
    required String adminEmailAddress,
    required String adminFirstName,
    required String adminLastName,
    required String adminPassword,
    required String? captchaResponse,
    required int editionId,
    required String name,
    required String tenancyName,
    required String timeZone,
  });
}
