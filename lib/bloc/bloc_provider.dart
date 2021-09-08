import 'package:flutter/material.dart';
import 'package:project/bloc/bloc_base.dart';

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  BlocProviderState<T> createState() => BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType()!;
    type;
    return provider.bloc;
  }

  static Type typeOf<T>() => T;
}

class BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}