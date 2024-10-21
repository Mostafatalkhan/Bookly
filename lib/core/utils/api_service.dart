import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://www.googleapis.com/books/v1';

  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await _dio.get('$baseUrl$endpoint');
    print('======================${response.statusCode}');
    return response.data;
  }
}
