import 'package:flutter/material.dart';
import 'package:workiom/domain/remote/dio_helper.dart';
import 'package:workiom/my_app.dart';
import 'package:workiom/ui/helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}
