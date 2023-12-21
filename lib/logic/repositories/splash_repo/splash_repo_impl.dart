import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:workiom/domain/remote/dio_helper.dart';
import 'package:workiom/domain/remote/end_points.dart';
import 'package:workiom/logic/repositories/splash_repo/splash_repo.dart';

import '../../../domain/models/login_info_model/login_info_model.dart';

class SplashRepoImpl extends SplashRepo {
  @override
  Future<Either<Failure, LoginInfoModel>> getCurrentLoginInformation(
      {required String? token}) async {
    try {
      var response = await DioHelper.getData(
        url: EndPoints.getCurrentLoginInformationEndPoint,
        token: token,
      );
      return right(LoginInfoModel.fromJson(response.data['result']));
    } catch (ex) {
      log("there is an Error in SplashRepoImpl in getCurrentLoginInformation method.");
      log(ex.toString());
      return left(Failure(errorMsg: ex.toString()));
    }
  }
}
