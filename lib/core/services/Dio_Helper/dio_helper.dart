import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper {
  static Dio? dio;

//* for intialization in main function
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      ),
    );
  }

  //! for get function

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParamters, //? optional parameter
    Map<String, dynamic>? data, //? the body of the request and it is optional
    Map<String, dynamic>? headers,
  }) {
    try {
      dio!.options.headers = headers;
      return dio!.get(
        endPoint,
        queryParameters: queryParamters,
        data: data,
        // options: Options(
        //   headers: headers,
        // ),
      );
    } catch (e) {
      rethrow;
    }
  }

  //! for post function



  static Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? queryParamters, //? optional parameter
    Map<String, dynamic>? data, //? the body of the request and it is optional
    Map<String, dynamic>? headers,
  }) {
    try {
      dio?.options.headers = headers;
      return dio!.post(
        endPoint,
        queryParameters: queryParamters,
        data: data,
        // options: Options(
        //   headers: headers,
        // ),
      );
    } catch (e) {
      rethrow;
    }
  }


  //!for put function



  static Future<Response> put({
    required String endPoint,
    Map<String, dynamic>? queryParamters, //? optional parameter
    Map<String, dynamic>? data, //? the body of the request and it is optional
    Map<String, dynamic>? headers,
  }) {
    try {
      dio!.options.headers = headers;
      return dio!.put(
        endPoint,
        queryParameters: queryParamters,
        data: data,
        // options: Options(
        //   headers: headers,
        // ),
      );
    } catch (e) {
      rethrow;
    }
  }
//! for patch function


  static Future<Response> patch({
    required String endPoint,
    Map<String, dynamic>? queryParamters, //? optional parameter
    Map<String, dynamic>? data, //? the body of the request and it is optional
    Map<String, dynamic>? headers,
  }) {
    try {
      dio!.options.headers = headers;
      return dio!.patch(
        endPoint,
        queryParameters: queryParamters,
        data: data,
        // options: Options(
        //   headers: headers,
        // ),
      );
    } catch (e) {
      rethrow;
    }
  }


  //!for delete function


  
  static Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? queryParamters, //? optional parameter
    Map<String, dynamic>? data, //? the body of the request and it is optional
    Map<String, dynamic>? headers,
  }) {
    try {
      dio!.options.headers = headers;
      return dio!.delete(
        endPoint,
        queryParameters: queryParamters,
        data: data,
        // options: Options(
        //   headers: headers,
        // ),
      );
    } catch (e) {
      rethrow;
    }
  }

}













// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_app/core/Services/Dio_Helper/end_points.dart';

// class DioHelper {
//   static late Dio dio;

//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: EndPoints.baseUrl,
//         receiveDataWhenStatusError: true,
//         // connectTimeout: 60 * 1000,
//         // receiveTimeout: 60 * 1000,
//       ),
//     );
//   }

//   static Future<Response> postData(
//       {required String url,
//         Map<String, dynamic>? data,
//         Map<String, dynamic>? query,
//         String? token}) async {
//     dio.options.headers = {
//       'Content-Type': 'application/json',
//       'Authorization': token ?? '',
      
//     };

//     Response response = await dio.post(url,
//         queryParameters: query,
//         data: data,
//         options: Options(
//           followRedirects: false,
//           validateStatus: (status) {
//             return status! <= 500;
//           },
//         ));

//     debugPrint('Status: ${response.statusCode} = ${dio.options.baseUrl + url}');

//     return response;
//   }

//   static Future<Response> puttData(
//       {required String url,
//         Map<String, dynamic>? data,
//         Map<String, dynamic>? query,
//         String? token}) async {
//     dio.options.headers = {
//       'Content-Type': 'application/json',
//       'Authorization': token ?? '',
      
//     };

//     Response response = await dio.put(url,
//         queryParameters: query,
//         data: data,
//         options: Options(
//           followRedirects: false,
//           validateStatus: (status) {
//             return status! <= 500;
//           },
//         ));

//     debugPrint('Status: ${response.statusCode} = ${dio.options.baseUrl + url}');

//     return response;
//   }

//   static Future<Response> getData(
//       {required String url, Map<String, dynamic>? query, String? token}) async {
//     dio.options.headers = {
//       'lang': 'en',
//       //'Authorization': token ?? '',
//       'Content-Type': 'application/json',

//     };

//     Response response = await dio.get(
//       url,
//       queryParameters: query,
//     );

//     debugPrint('Status: ${response.statusCode} = ${dio.options.baseUrl + url}');

//     return response;
//   }

//   static Future<Response> deleteData(
//       {required String url, Map<String, dynamic>? query,   Map<String, dynamic>? data, String? token}) async {
//     dio.options.headers = {
//       'lang': 'en',
//       'Authorization': token ?? '',
//       'Content-Type': 'application/json',

//     };

//     Response response = await dio.delete(
//       url,
//       queryParameters: query,
//       data: data,
//     );

//     debugPrint('Status: ${response.statusCode} = ${dio.options.baseUrl + url}');

//     return response;
      
//       }

// }