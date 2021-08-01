import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone App',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                soundName: 'light-storm.wav',
                textSound: 'Light Storm',
                keyColor: Colors.red,
              ),
              buildKey(
                  soundName: 'bamboo.mp3',
                  textSound: 'Bamboo Wind',
                  keyColor: Colors.orange),
              buildKey(
                  soundName: 'cave.mp3',
                  textSound: 'Cave Dripping Water',
                  keyColor: Colors.yellow),
              buildKey(
                  soundName: 'fireplace.wav',
                  textSound: 'Fireplace',
                  keyColor: Colors.green),
              buildKey(
                  soundName: 'forest.wav',
                  textSound: 'Rainforest',
                  keyColor: Colors.teal),
              buildKey(
                  soundName: 'heavy.mp3',
                  textSound: 'Strong Storm',
                  keyColor: Colors.blue),
              buildKey(
                  soundName: 'river.wav',
                  textSound: 'River',
                  keyColor: Colors.purple),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            stopSounds();
          },
          child: const Icon(Icons.stop),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}

AudioPlayer loopingPlayer = AudioPlayer();
stopSounds() {
  loopingPlayer.stop();
}

Future<void> playSound(String soundName, double volume) async {
  loopingPlayer.stop();
  final player = AudioCache();
  loopingPlayer = await player.loop('$soundName', volume: volume);
  // player.loop('$soundName').then((pl) {
  //
  // });
}

Expanded buildKey(
    {required String soundName,
    required Color keyColor,
    required String textSound,
    double volume = 1.0}) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        playSound(soundName, volume);
      },
      child: Text(
        textSound,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(keyColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
      ),
    ),
  );
}
