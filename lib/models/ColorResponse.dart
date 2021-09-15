import 'package:project/models/color.dart';

class ColorResponse {
  final List<Color> results;
  final String error;

  ColorResponse(this.results, this.error);

  ColorResponse.fromJson(Map<String, dynamic> json)
      : results =
  (json["results"] as List).map((i) => new Color.fromJson(i)).toList(),
        error = "";

  ColorResponse.withError(String errorValue)
      : results = [],
        error = errorValue;
}