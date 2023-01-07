import 'package:bullseye/prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'bottom_bar.dart';
import 'control.dart';
import 'game_model.dart';

void main() {
  runApp(
    const BullsEyeApp(),
  );
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sets orientation from flutter. Only available for Android.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return const MaterialApp(
      title: 'Bullete',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(targetValue: _model.target),
            Control(
              model: _model,
            ),
            TextButton(
              onPressed: () {
                _showAlert(context);
              },
              child: const Text(
                'Hit Me!',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            BottomBar(
              totalScore: _model.totalScore,
              round: _model.round,
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
      child: const Text('Awesome'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Title'),
            content: Text('Current round score ${_model.roundScore()}'),
            actions: [okButton],
            elevation: 5,
          );
        });
  }
}
