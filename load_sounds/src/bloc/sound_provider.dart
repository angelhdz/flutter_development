import 'package:flutter/material.dart';
import 'package:sound_test/src/bloc/sound_bloc.dart';

class SoundProvider extends InheritedWidget {
  SoundProvider({Widget child, Key key}) : super(child: child);

  final SoundBloc soundBloc = new SoundBloc();

  @override
  bool updateShouldNotify(Widget oldWidget) => true;

  static SoundBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SoundProvider>()
        .soundBloc;
  }
}