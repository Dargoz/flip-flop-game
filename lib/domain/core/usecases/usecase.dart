import 'package:dio/dio.dart';

abstract class UseCase<Type, Params> {

  Future<Type> useCase();

  Future<Type> executeUseCase(Params params) async {
    var response;
    try {
      response = await useCase();
      return response;
    } on DioError catch (dioError) {
      print(dioError);
      return response;
    } catch (error) {
      return response;
    }
  }

}