import 'package:audioplayers/audioplayers.dart';

class Sound {

  final String link;
  final String created;
  final String modified;
  final String title;
  final String subtitle;
  final String description;
  final String image;

  AudioPlayer _audioPlayer;

  Sound({
    this.link,
    this.title,
    this.subtitle,
    this.description,
    this.image,
    this.created,
    this.modified
  }) {
    _createPlayer();
  }

  factory Sound.fromMap(Map<String, dynamic> map) {
    return Sound(
      title: map['title'],
      subtitle: map['subtitle'],
      link: map['link'],
      description: map['description'],
      image: map['image'],
      created: map['created'],
      modified: map['modified'],
    );
  }

  void _createPlayer() async {
    _audioPlayer = new AudioPlayer();
  }

  void play() async {
    await _audioPlayer.play(this.link, );
  }
}
