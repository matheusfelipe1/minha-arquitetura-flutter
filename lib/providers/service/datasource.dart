import 'dart:convert';

import 'package:archteture/providers/service/dio_services.dart';

class DataSource {
  
  static final DataSource _instance = DataSource._();
  DataSource._();
  factory DataSource() => DataSource._instance;

  final _http = CustomHttp();

  Future<dynamic> get(String path, dynamic body) async {
    final response = await _http.client.get(path);
    return response.data;
  }

  Future<dynamic> post(String path, dynamic body) async {
    final response = await _http.client.post(path, data: jsonEncode(body));
    return response.data;

  }

  Future<dynamic> put(String path, dynamic body) async {
    final response = await _http.client.put(path, data: jsonEncode(body));
    return response.data;

  }

}


