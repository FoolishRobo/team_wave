import 'package:dio/dio.dart';

class HttpMiddleware{
  Dio dio = new Dio();



  Future<Dio> getConfiguredDio(baseUrl)async{
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;



    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) async {
              //TODO: Do something before request is sent
              return options; //continue
            },
            onResponse:(Response response) async {
              //TODO: Do something with the response
              return response; // continue
            },
            onError: (DioError error) async {
              //TODO: Do something with response error
              return error; //continue
            }
        )
    );

    return dio;
  }
}