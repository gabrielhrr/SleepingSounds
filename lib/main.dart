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
              buildKey(noteNumber: 1, keyColor: Colors.red),
              buildKey(noteNumber: 2, keyColor: Colors.orange),
              buildKey(noteNumber: 3, keyColor: Colors.yellow),
              buildKey(noteNumber: 4, keyColor: Colors.green),
              buildKey(noteNumber: 5, keyColor: Colors.teal),
              buildKey(noteNumber: 6, keyColor: Colors.blue),
              buildKey(noteNumber: 7, keyColor: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}

void playSound(int soundNumber) {
  final player = AudioCache();
  player.play('note$soundNumber.wav');
}

Expanded buildKey({required int noteNumber, required Color keyColor}) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        playSound(noteNumber);
      },
      child: Text(''),
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
