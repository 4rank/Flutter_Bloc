import 'package:project/models/ColorResponse.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final baseUrl = 'https://random-data-api.com/api/color/random_color';
  final Dio _dio = Dio();

  Future<ColorResponse> getColor() async {
    try {
      Response response = await _dio.get(baseUrl);
      return ColorResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ColorResponse.withError("$error");
    }
  }
}
