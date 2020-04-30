
import 'package:flutter/material.dart';
import 'package:sound_test/src/bloc/sound_provider.dart';
import 'package:sound_test/src/sound.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final soundProvider = SoundProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: soundProvider.soundStream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {                  
                    return Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('Songs'),
                          Expanded(
                              child: Scrollbar(
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: soundProvider.sounds.length,
                              itemBuilder: (context, index) {
                                final Sound sound = soundProvider.sounds[index];
                                return Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 350.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.grey)
                                            ]
                                          ),
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(children: <Widget>[
                                            Row(children: <Widget>[
                                              Icon(Icons.music_note, color: Colors.blue),
                                              Text(sound.title, style: TextStyle(color: Colors.blue)),
                                              Padding(
                                                padding: EdgeInsets.only(left: 10.0),
                                                child: IconButton(
                                                  icon: Icon(Icons.play_circle_filled),
                                                  color: Colors.blue,
                                                  onPressed: () {
                                                    print('Playing ${sound.link}...');                                                                                      
                                                    sound.play();                                   
                                                  },
                                            ))
                                          ]),
                                        ]
                                      )
                                    )
                                  )
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          )),
    );
  }
}
