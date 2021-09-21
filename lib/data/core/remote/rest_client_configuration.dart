import 'package:flip_flop_game/data/interceptor.dart';
import 'package:dio/dio.dart';




abstract class RestClientConfiguration {
  static final Dio dio = Dio()..interceptors.add(HttpInterceptor());

}
