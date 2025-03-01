// ignore_for_file: public_member_api_docs, sort_constructors_first
// This class ia a wrapper for all the API calls or services that we will make in the app.
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl =
      'https://potterapi-fedeperin.vercel.app/en/'; // private instance of the base URL

  final Dio _dio; // private instance of Dio
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final response = await _dio.get('$_baseUrl$endpoint');
    return response.data; // This data is already decoded
  }
}
