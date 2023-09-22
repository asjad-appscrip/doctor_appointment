// coverage:ignore-file
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:doctor_appointment/data/data.dart';
import 'package:doctor_appointment/res/res.dart';
import 'package:doctor_appointment/utility/utils.dart';
import 'package:http/http.dart' as http;

/// API WRAPPER to call all the APIs and handle the error status codes
class ApiWrapper {

  final String baseUrl = '';

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(
    String apiUrl,
    Request request,
    dynamic data,
    bool isLoading,
    Map<String, String> headers,
  ) async {
    if (await Utility.isNetworkAvailable()) {
      Future<ResponseModel> responseModel;
      responseModel =
          makeFinalRequest(apiUrl, request, data, isLoading, headers);

      return responseModel;
    } else {
      return ResponseModel(
        data:
            '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
        hasError: true,
        statusCode: 1000,
      );
    }
  }

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeFinalRequest(
    String url,
    Request request,
    dynamic data,
    bool isLoading,
    Map<String, String> headers,
  ) async {
    /// To see whether the network is available or not
    if (await Utility.isNetworkAvailable()) {
      switch (request) {
        /// Method to make the Get type request
        case Request.get:
          {
            var uri = baseUrl + url;

            if (isLoading) Utility.showLoader();

            try {
              final response = await http
                  .get(
                    Uri.parse(uri),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();
              var res = returnResponse(response);
              log(
                'Method: GET\nURL :- $uri\nData :- $data\nHeaders :- $headers\nResponse :-\nStatus Code :- ${res.statusCode}\nResponse Data :- ${res.data}',
              );
              return res;
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                data: '{"message":"Request timed out"}',
                hasError: true,
              );
            }
          }
        case Request.post:

          /// Method to make the Post type request
          {
            var uri = baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .post(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              var res = returnResponse(response);
              log(
                'Method: POST\nURL :- $uri\nData :- $data\nHeaders :- $headers\nResponse :-\nStatus Code :- ${res.statusCode}\nResponse Data :- ${res.data}',
              );
              return res;
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                data: '{"message":"Request timed out"}',
                hasError: true,
              );
            }
          }
      }
    }

    /// If there is no network available then instead of print can show the no internet widget too
    else {
      return ResponseModel(
        data: '{"message": "No internet available"}',
        hasError: true,
        statusCode: 1000,
      );
    }
  }

  /// Method to return the API response based upon the status code of the server
  ResponseModel returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ResponseModel(
          data: response.body,
          hasError: false,
          statusCode: response.statusCode,
        );
      default:
        return ResponseModel(
          data: response.body,
          hasError: true,
          statusCode: response.statusCode,
        );
    }
  }
}
