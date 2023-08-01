import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class CustomHttp {
  final client = Dio();
  CustomHttp() {
    client.options.baseUrl = dotenv.get('baseUrl');
    client.interceptors.add(const Interceptor());
    client.interceptors.add(CustomInterceptors());
    client.options.connectTimeout = const Duration(milliseconds: 8000);
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}