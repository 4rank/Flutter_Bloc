import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/bloc/bloc_base.dart';
import 'package:project/repositories/api_client.dart';
import 'package:project/repositories/repositories.dart';
import 'package:project/screen/main_screen.dart';

class MyApp extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = MyApp();

  final Repository repository = Repository(
    quoteApiClient: ApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final Repository repository;

  App({Key? key, required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote'),
        ),
        body: BlocProvider(
          create: (context) => ColorBloc(repository: repository),
          child: HomePage(),
        ),
      ),
    );
  }
}