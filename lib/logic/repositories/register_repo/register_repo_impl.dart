import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:workiom/domain/models/edition_model/edition_model.dart';
import 'package:workiom/domain/models/is_tenant_available_model/is_tenant_available_model.dart';
import 'package:workiom/domain/models/password_complexity_model/password_complexity_model.dart';
import 'package:workiom/domain/remote/dio_helper.dart';
import 'package:workiom/domain/remote/end_points.dart';
import 'package:workiom/logic/repositories/register_repo/register_repo.dart';
import 'package:workiom/logic/repositories/splash_repo/splash_repo.dart';

import '../../../domain/models/register_tenant_model/register_tenant_model.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failure, List<EditionModel>>> getEditionsForSelect() async {
    try {
      var response =
          await DioHelper.getData(url: EndPoints.getEditionsForSelectEndPoint);
      final List<EditionModel> editions = [];
      for (var item in response.data['result']['editionsWithFeatures']) {
        editions.add(EditionModel.fromJson(item['edition']));
      }
      return right(editions);
    } catch (ex) {
      log("there is an Error in RegisterRepoImpl in getEditionsForSelect method.");
      log(ex.toString());
      return left(Failure(errorMsg: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, PasswordComplexityModel>>
      getPasswordComplexitySetting() async {
    try {
      var response = await DioHelper.getData(
          url: EndPoints.getPasswordComplexitySettingEndPoint);

      return right(
        PasswordComplexityModel.fromJson(
          response.data['result']["setting"],
        ),
      );
    } catch (ex) {
      log("there is an Error in RegisterRepoImpl in getPasswordComplexitySetting method.");
      log(ex.toString());
      return left(
        Failure(
          errorMsg: ex.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, IsTenantAvailableModel>> isTenantAvailable(
      {required String tenantName}) async {
    try {
      var response = await DioHelper.postData(
          url: EndPoints.isTenantAvailableEndPoint,
          body: {"tenancyName": tenantName});
      return right(
        IsTenantAvailableModel.fromJson(
          response.data["result"],
        ),
      );
    } catch (ex) {
      log("there is an Error in RegisterRepoImpl in isTenantAvailable method.");
      log(ex.toString());
      return left(
        Failure(
          errorMsg: ex.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterTenantModel>> registerTenant(
      {required String adminEmailAddress,
      required String adminFirstName,
      required String adminLastName,
      required String adminPassword,
      required String? captchaResponse,
      required int editionId,
      required String name,
      required String tenancyName,
      required String timeZone}) async {
    try {
      var response = await DioHelper.postData(
        url: "${EndPoints.registerTenantEndPoint}?timeZone=$timeZone",
        body: {
          "adminEmailAddress": adminEmailAddress,
          "adminFirstName": adminFirstName,
          "adminLastName": adminLastName,
          "adminPassword": adminPassword,
          "captchaResponse": captchaResponse,
          "editionId": editionId,
          "name": name,
          "tenancyName": tenancyName
        },
      );

      return right(
        RegisterTenantModel.fromJson(response.data["result"]),
      );
    } catch (ex) {
      log("there is an Error in RegisterRepoImpl in registerTenant method.");
      log(ex.toString());
      return left(
        Failure(
          errorMsg: ex.toString(),
        ),
      );
    }
  }
}
