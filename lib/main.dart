import 'package:bullseye/hitme_button.dart';
import 'package:bullseye/prompt.dart';
import 'package:bullseye/style_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // Hide status bar if any.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
    _model = GameModel(GameModel.nextTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: Prompt(targetValue: _model.target),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Control(
                          model: _model,
                        ),
                      ),
                      HitmeButton(
                        text: 'Hit Me!',
                        onPressed: () => _showAlert(context),
                      ),
                      BottomBar(
                        totalScore: _model.totalScore,
                        round: _model.round,
                        onStartOver: () {
                          _startNewGame();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startNewGame() {
    setState(() {
      _model = GameModel(GameModel.nextTargetValue());
    });
  }

  void _showAlert(BuildContext context) {
    var okButton = StyleButton(
      icon: Icons.close,
      onPressed: () {
        Navigator.of(context).pop();
        _startNextRound();
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_model.summaryTitle()),
          content: Text('Current round score ${_model.roundScore()}'),
          actions: [okButton],
          elevation: 5,
        );
      },
    );
  }

  void _startNextRound() {
    setState(
      () {
        _model.updateTotalScore();
        _model.nextRound(target: GameModel.nextTargetValue());
      },
    );
  }
}
