import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int totalScore;
  final int round;
  final VoidCallback onStartOver;

  const BottomBar({
    Key? key,
    required this.totalScore,
    required this.round,
    required this.onStartOver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Text('Start Over'),
            onPressed: () {
              onStartOver();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Text('Score:'),
              Text('$totalScore'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Text('Round:'),
              Text('$round'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Text('info'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
