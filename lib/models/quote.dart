import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final id;
  final String quoteColor;

  const Quote({this.id, required this.quoteColor});

  @override
  List<Object> get props => [id, quoteColor];

  static Quote fromJson(dynamic json) {
    return Quote(
      id: json['_id'],
      quoteColor: json['quoteName'],
    );
  }

  @override
  String toString() => 'Quote { id: $id }';
}