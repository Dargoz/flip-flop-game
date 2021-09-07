import 'package:flutter_clean_architecture_template/data/interceptor.dart';
import 'package:dio/dio.dart';




abstract class RestClientConfiguration {
  static final Dio dio = Dio()..interceptors.add(HttpInterceptor());

}
