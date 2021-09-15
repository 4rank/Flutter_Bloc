import 'package:equatable/equatable.dart';

import 'package:project/models/models.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteEmpty extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Color quote;

  const QuoteLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

class QuoteError extends QuoteState {}