import 'package:bloc/bloc.dart' show Bloc;
import 'package:rxdart/rxdart.dart';
import 'package:project/repositories/repositories.dart';
import 'package:project/models/models.dart';
import 'package:project/bloc/bloc_base.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository repository;

  QuoteBloc({required this.repository});

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is FetchQuote) {
      yield QuoteLoading();
      try {
        final Color quote = await repository.fetchQuote();
        yield QuoteLoaded(quote: quote);
      } catch (_) {
        yield QuoteError();
      }
    }
  }
}
