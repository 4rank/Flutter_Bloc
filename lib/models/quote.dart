import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final id;
  final String quoteName;
  final String quoteFood;

  const Quote({this.id, required this.quoteName, required this.quoteFood});

  @override
  List<Object> get props => [id, quoteName, quoteFood];

  static Quote fromJson(dynamic json) {
    return Quote(
      id: json['_id'],
      quoteName: json['quoteText'],
      quoteFood: json['quoteAuthor'],
    );
  }

  @override
  String toString() => 'Quote { id: $id }';
}