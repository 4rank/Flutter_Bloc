import 'package:flutter/material.dart';
import 'package:project/bloc/bloc_provider.dart';
import 'package:project/bloc/main_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My first BLoC app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: bloc.outCounter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  "${snapshot.data ?? 0}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.inEvent.add(MainBlocEvent.incrementCounter),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}