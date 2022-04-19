import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInstance {
  static Dio? _dioInstance;
  static BaseOptions? _options;

  static Dio api() {
    _options = _options ??
        BaseOptions(
            baseUrl: dotenv.env['API_URL']!,
            connectTimeout: 30 * 1000,
            queryParameters: {
              'api_key': dotenv.env['API_KEY'],
            });

    _dioInstance = Dio(_options);

    return _dioInstance!;
  }
}
