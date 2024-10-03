import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ResetPasswordCall {
  static Future<ApiCallResponse> call({
    String? oobCode = '',
    String? newPassword = '',
    String? apiKey = 'AIzaSyBcG-wzR7ZA87aOd5YKgs571I1H60j3nJ0',
  }) async {
    final ffApiRequestBody = '''
{
  "oobCode": "$oobCode",
  "newPassword": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl:
          'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=$apiKey',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GoogleMapsLocationConverterCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
    String? apiKey = 'AIzaSyDO0cp7qjh7_-POR7Azm1RGktAjU4Wa0uo',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Maps Location Converter',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? longAddress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[1].long_name''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[4].long_name''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[5].long_name''',
      ));
}

class GooglePlaceCall {
  static Future<ApiCallResponse> call({
    String? yourApiKey = 'AIzaSyDO0cp7qjh7_-POR7Azm1RGktAjU4Wa0uo',
    String? yourQuery = '',
    String? yourInput = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Place',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$yourQuery?input=$yourInput&key=$yourApiKey',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? direccion(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static double? latitud(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      ));
  static double? longitud(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
