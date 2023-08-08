import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../tools/shared_pref_util.dart';
import 'app_api_exception.dart';
import 'network_helper.dart';

enum RequestType { get, put, post }

class NetworkService {
  const NetworkService._();

  static Map<String, String> _getHeaders({bool useBearer = false}) {
    Map<String, String> header = {'Content-Type': 'application/json'};
    
    if(useBearer){
      header.addAll({'Authorization': 'Bearer ${SharedPrefUtil.getToken()}'});
    }

    return header;
  }
      

  static Future<http.Response> _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    switch(requestType){
      case RequestType.get:
        return http.get(uri, headers: headers);
      case RequestType.post:
        return http.post(uri, headers: headers, body : jsonEncode(body));
      case RequestType.put:
        return http.put(uri, headers: headers, body : jsonEncode(body));
    }
  }

  static Future<http.Response> sendRequest({
    required RequestType requestType,
    required String baseUrl,
    required String endpoint,
    bool useBearer = false,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {

    try{
      final headers = _getHeaders(useBearer: useBearer);
      final url0 = NetworkHelper.concatUrlQP(baseUrl + endpoint, queryParam);

      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(url0),
          headers: headers,
          body: body);

      return response;
    } on SocketException {
      throw FetchDataException('No internet Exception');
    }
  }
}
