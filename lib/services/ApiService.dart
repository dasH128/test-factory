import 'dart:convert';
import 'dart:io';
import 'package:busrefactori/entities/novedad.dart';
import 'package:busrefactori/entities/report1.dart';
import 'package:busrefactori/entities/reporte_check.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> iniciarSesion(String username, String password) async {
    try {
      Map<String, dynamic> data = {
        "procedure": "{ CALL busrefactori.SP_BUSREFACTORI_LOGIN2(?,?) }",
        "params": [username, password],
      };
      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: json.encode(data));
      print('**********');
      print('u:${username} - p:$password');
      print(response);
      print(response.data);
      print('**********');
      return response;
    } on DioError catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<Response?> guardarReporte(Map<String, dynamic>? dato) async {
    try {
      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
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
      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: json.encode(dato));

      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<Response?> guardarNovedad(Map<String, dynamic>? dato) async {
    try {
      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: json.encode(dato));

      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Reporte1>> buscarReporte(String fecha1, String fecha2) async {
    try {
      // "params": ["2023-01-01","2024-01-01"]
      Map<String, dynamic> dato = {
        "procedure":
            "{ CALL busrefactori.SP_BUSREFACTORI_BUSCAR_REPORTE(?,?) }",
        "params": [fecha1, fecha2]
      };

      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: json.encode(dato));

      //return response;

      dynamic values = json.decode(response.toString());
      //var f = Reporte1.fromJson(values['data']);
      List<Reporte1> lista = [];
      values['data'].map((i) {
        lista.add(Reporte1.fromJson(i));
        return;
      }).toList();
      print('++++++++++++++++');
      return lista;
    } on DioError catch (e) {
      return []; //null;
    }
  }

  Future<List<ReporteCheck>> buscarCheck(String fecha1, String fecha2) async {
    try {
      // "params": ["2023-01-01","2024-01-01"]
      Map<String, dynamic> dato = {
        "procedure": "{ CALL busrefactori.SP_BUSREFACTORI_BUSCAR_CHECK(?,?) }",
        "params": [fecha1, fecha2]
      };

      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: json.encode(dato));

      dynamic values = json.decode(response.toString());
      List<ReporteCheck> lista = [];
      values['data'].map((i) {
        lista.add(ReporteCheck.fromJson(i));
        return;
      }).toList();

      print('CHECK******');
      print(values);
      return lista;
    } on DioError catch (e) {
      return [];
    }
  }

  Future<List<Novedad>> buscarNovedad(String fecha1, String fecha2) async {
    try {
      // "params": ["2023-01-01","2024-01-01"]
      Map<String, dynamic> dato = {
        "procedure":
            "{ CALL busrefactori.SP_BUSREFACTORI_BUSCAR_NOVEDAD(?,?) }",
        "params": [fecha1, fecha2]
      };

      Response response =
          await _dio.post("http://13.59.147.125:8080/api/procedure",
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: json.encode(dato));

      dynamic values = json.decode(response.toString());
      List<Novedad> lista = [];
      values['data'].map((i) {
        lista.add(Novedad.fromJson(i));
        return;
      }).toList();

      print('CHECK******');
      print(values);
      return lista;
    } on DioError catch (e) {
      return [];
    }
  }
}
