import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sound_test/src/sound.dart';

class SoundBloc {
  final String songsUrl =
      'https://raw.githubusercontent.com/angelhdz/dartpad_json/master/test2.json';

  List<Sound> sounds = [];
  StreamController _controller = StreamController<List<Sound>>();

  Stream<List<Sound>> get soundStream => _controller.stream;

  SoundBloc() {
    _loadSongs();
  }

  void dispose() {
    _controller.close();
  }

  void _loadSongs() async {
    final request = await http.get(songsUrl);

    final response = json.decode(request.body);
      print(response['result']['list']);
    sounds = response['result']['list']
        .map<Sound>((item) => Sound.fromMap(item))
        .toList();

    Future.delayed(
        Duration(milliseconds: 1000), () => _controller.sink.add(sounds));
  }
}