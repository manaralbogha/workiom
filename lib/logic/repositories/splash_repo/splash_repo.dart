import 'package:dartz/dartz.dart';

import '../../../domain/models/login_info_model/login_info_model.dart';

abstract class SplashRepo {
  Future<Either<Failure, LoginInfoModel>> getCurrentLoginInformation(
      {required String? token});
}

class Failure {
  final String errorMsg;

  Failure({required this.errorMsg});
}
