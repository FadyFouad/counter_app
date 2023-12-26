import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 26/12/2023 at 12:04.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


/// create custom bloc observer to observe all blocs and calculate times between events and states and print them
class TimeCalcBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: ${event.runtimeType} time : ${DateTime.now().second}:${DateTime.now().millisecond}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Change: ${change.runtimeType} time : ${DateTime.now().second}:${DateTime.now().millisecond}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: ${transition.runtimeType} time : ${DateTime.now().second}:${DateTime.now().millisecond}');
  }
}