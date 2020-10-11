import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:team_wave/service/endpoints.dart';
import 'package:team_wave/service/middleware.dart';

Future getHttpsServiceFuture(String requestUrl, {responseSerializer,
  Map<String, dynamic> queryParams}) async {
  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response httpResponse;

  try {
    Dio http = await httpMiddleware.getConfiguredDio(Api.baseUrl);
    httpResponse = await http.get(requestUrl, queryParameters: queryParams);

  } on DioError catch (error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return Future.value({
          "success": false,
          "msg": "CONNECT_TIMEOUT",
          "response": error.response,
        });
      case DioErrorType.RECEIVE_TIMEOUT:
        return Future.value({
          "success": false,
          "msg": "RECEIVE_TIMEOUT",
          "response": error.response,
        });
      case DioErrorType.SEND_TIMEOUT:
        return Future.value({
          "success": false,
          "msg": "SEND_TIMEOUT",
          "response": error.response,
        });
      case DioErrorType.CANCEL:
        return Future.value({
          "success": false,
          "msg": "REQUEST CANCELED",
          "response": error.response,
        }); //
      case DioErrorType.DEFAULT:
        return Future.value({
          "success": false,
          "msg": "SOME ERROR OCCURRED: PLEASE CHECK YOUR NETWORK",
          "response": error.response,
        }); //
      case DioErrorType.RESPONSE:
        return Future.value({
          "success": false,
          "msg": "RESPONSE",
          "response": error.response,
        }); //
    }
    // TODO: log error

  }

  if (httpResponse.statusCode < 300 && httpResponse.statusCode >= 200) {
//    print("raw = ${httpResponse.data}");
    var responseBody;
    if (responseSerializer != null) {
      Map userMap = jsonDecode(httpResponse.toString());
      responseBody = responseSerializer(userMap);
//      print("rsponse = ${responseBody.toJson()}");
    } else {
      responseBody = httpResponse.data;
    }
//    responseBody.putIfAbsent("success", () => true);
    return responseBody;
  } else {
    return errorResponse();
  }
}

Future postHttpsServiceFuture(String requestUrl,
    {responseSerializer,
      Map<String, String> queryParams,
      dynamic postData,
      String authKey,
      isForm = false}) async {
  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response httpResponse;

  var encodedBody;
  if (!isForm) {
    encodedBody = json.encode(postData);
  } else {
    encodedBody = FormData.fromMap(postData);
  }
  try {
    Dio dio = await httpMiddleware.getConfiguredDio(Api.baseUrl);
    httpResponse = await dio.post(requestUrl,
      queryParameters: queryParams,
      data: encodedBody,
    );

  } on DioError catch (error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return Future.value({
          "success": false,
          "msg": "CONNECT_TIMEOUT",
          "response": error.response,
        });
      case DioErrorType.RECEIVE_TIMEOUT:
        return Future.value({
          "success": false,
          "msg": "RECEIVE_TIMEOUT",
          "response": error.response,
        });
      case DioErrorType.SEND_TIMEOUT:
        return Future.value({
          "success": false,
          "msg": "SEND_TIMEOUT",
          "response": error.response,
        });
      case DioErrorType.CANCEL:
        return Future.value({
          "success": false,
          "msg": "REQUEST CANCELED",
          "response": error.response,
        }); //
      case DioErrorType.DEFAULT:
        return Future.value({
          "success": false,
          "msg": "SOME ERROR OCCURRED: PLEASE CHECK YOUR NETWORK",
          "response": error.response,
        }); //
      case DioErrorType.RESPONSE:
        return Future.value({
          "success": false,
          "msg": "RESPONSE",
          "response": error.response,
        }); //
    }
    // TODO: log error

  }

  if (httpResponse.statusCode < 300 && httpResponse.statusCode >= 200) {
    Map<String, dynamic> responseBody;
    if (responseSerializer != null) {
      responseBody = responseSerializer(httpResponse.data);
    } else {
      responseBody = httpResponse.data;
    }
    responseBody.putIfAbsent("success", () => true);
    return responseBody;
  } else {
    return errorResponse();
  }
}

Map<String, dynamic> timeoutResponse() {
  return {
    "success": false,
    "message": "Please check your network connection and try again."
  };
}

Map<String, dynamic> errorResponse() {
  return {
    "success": false,
    "message": "Something went wrong, please try again."
  };
}
