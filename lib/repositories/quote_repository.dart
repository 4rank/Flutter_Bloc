import 'dart:async';

import 'package:project/repositories/api_client.dart';
import 'package:project/models/models.dart';

class QuoteRepository {
  final ApiClient quoteApiClient;

  QuoteRepository({required this.quoteApiClient});

  Future<Color> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}