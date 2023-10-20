import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> iniciarSesion(String username,String password) async {
    try {
      Map<String, dynamic> data = {
      "procedure": "{ CALL busrefactori.SP_BUSREFACTORI_LOGIN(?,?) }",
      "params": [username,password],
      };
      Response response = await _dio.post(
          "http://13.59.147.125:8080/api/procedure",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: json.encode(data));
          print(response.data);
      return response;
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<Response?> guardarReporte(Map<String, dynamic>? dato) async {
    try {
      Response response = await _dio.post(
          "http://13.59.147.125:8080/api/procedure",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: json.encode(dato));

      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Response?> guardarCheck(Map<String, dynamic>? dato) async {
    try {
      Response response = await _dio.post(
          "http://13.59.147.125:8080/api/procedure",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: json.encode(dato));

      return response;
    } on DioError catch (e) {
      return null;
    }
  }
}
