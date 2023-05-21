import 'package:bloc/bloc.dart';
import 'package:challenge_pokedex/core/inject/inject.dart';
import 'package:challenge_pokedex/core/shared/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_pokedex/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.init();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
