
import 'package:dio/dio.dart';

import 'github/constants.dart';

class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path} , baseUrl : ${options.baseUrl} entity : ${options.data}');
    if(options.baseUrl == 'https://api.github.com/') {
      options.headers['Authorization'] = 'Bearer $githubToken';
      options.headers['Accept'] = 'application/vnd.github.v3+json';
    }
    print('header : ${options.headers} entity : ${options.data}');
    return super.onRequest(options, handler);

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    print('RESPONSE[${response.statusCode}] => BODY:\n ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} data: ${err.requestOptions.data}');
    // TODO: handle network error
    switch(err.response?.statusCode) {
      case 403:
      case 500:
      default:
        super.onError(err, handler);
        break;
    }
  }
}