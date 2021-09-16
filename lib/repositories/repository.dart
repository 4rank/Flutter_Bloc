import 'package:project/models/ColorResponse.dart';
import 'package:project/repositories/api_client.dart';

class Repository {
  ApiClient _apiProvider = ApiClient();

  Future<ColorResponse> getColor(){
    return _apiProvider.getColor();
  }
}