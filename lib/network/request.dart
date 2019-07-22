import 'dart:io';
import 'package:dio/dio.dart';

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Request {
  static const String baseUrl = 'http://www.shuqi.com/';

  static Future<dynamic> get({String action, Map params}) async {
    return Request.mock(action: action, params: params);
  }

  static Future<dynamic> post({String action, Map params}) async {
    return Request.mock(action: action, params: params); 
  }

  static Future<dynamic> mock({String action, Map params}) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson['data'];
  }

  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      // headers: {
      //   HttpHeaders.userAgentHeader: "dio",
      //   "api": "1.0.0",
      // },
      contentType: ContentType.json,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      responseType: ResponseType.plain,
    );
    return Dio(options);
  }
}
