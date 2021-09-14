import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/bloc/bloc_base.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteEmpty) {
          BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
        }
        if (state is QuoteError) {
          return Center(
            child: Text('failed'),
          );
        }
        if (state is QuoteLoaded) {
          return ListTile(
            leading: Text(
              '${state.quote.id}',
              style: TextStyle(fontSize: 15.0),
              textScaleFactor: 3.0,
            ),
            title: Text(state.quote.quoteName),
            isThreeLine: true,
            subtitle: Text(state.quote.quoteFood),
            dense: true,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}