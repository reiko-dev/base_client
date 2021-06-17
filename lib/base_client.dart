import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_client/services/app_exception.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION_IN_SECONDS = 20;

  //Get
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri).timeout(
            Duration(seconds: TIME_OUT_DURATION_IN_SECONDS),
          );
      return _processResponse(response);
    } on SocketException {
      throw FetchDataExpection(
        message: 'No internet connection',
        url: uri.toString(),
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time.', url: uri.toString());
    }
  }

  //Post
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var payload = json.encode(payloadObj);

    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.post(uri, body: payload).timeout(
            Duration(seconds: TIME_OUT_DURATION_IN_SECONDS),
          );
      return _processResponse(response);
    } on SocketException {
      throw FetchDataExpection(
        message: 'No internet connection',
        url: uri.toString(),
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time.', url: uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
          message: utf8.decode(response.bodyBytes),
          url: response.request!.url.toString(),
        );
      case 401:
      case 403:
        throw UnAuthorizedException(
          message: utf8.decode(response.bodyBytes),
          url: response.request!.url.toString(),
        );
      case 500:
      default:
        throw FetchDataExpection(
          message: 'Error occured with code: ${response.statusCode}',
          url: response.request!.url.toString(),
        );
    }
  }
}
