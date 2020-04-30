import 'package:flutter/material.dart';
import 'package:sound_test/src/bloc/sound_provider.dart';
import 'package:sound_test/src/pages/home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SoundProvider(
        child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Sounds'),
    ));
  }
}

