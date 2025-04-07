import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}
