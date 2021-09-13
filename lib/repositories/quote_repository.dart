import 'dart:async';

import 'package:project/repositories/api_client.dart';
import 'package:project/models/models.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  QuoteRepository({required this.quoteApiClient});

  Future<Quote> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}