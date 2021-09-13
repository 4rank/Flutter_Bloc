import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:project/models/models.dart';

class QuoteApiClient {
  final baseUrl = 'https://random-data-api.com/documentation';
  final http.Client httpClient;

  QuoteApiClient({
    required this.httpClient,
  });

  Future<Quote> httpQuote() async {
    final url = '$baseUrl/quotes/random';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return Quote.fromJson(json);
  }
}