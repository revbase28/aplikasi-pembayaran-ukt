import 'dart:convert';

import 'package:http/http.dart' as http;

import 'app_api_exception.dart';
import 'network_typedef.dart';

class NetworkHelper {
  const NetworkHelper._();

  static String concatUrlQP(String url, Map<String, String>? queryParameters) {
    if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    print("URL = ${result.substring(0, result.length - 1)}");
    //Delete last & character
    return result.substring(0, result.length - 1);
  }

  static R filterReponse<R>({
    required NetworkCallBack callBack,
    required http.Response response,
  }) {
    switch (response.statusCode) {
      case 201:
      case 200: {
        return callBack(jsonDecode(response.body));
      }
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
