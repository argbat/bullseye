import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int totalScore;
  final int round;

  const BottomBar({
    Key? key,
    required this.totalScore,
    required this.round,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Text('Start Over'),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const <Widget>[
              Text('Score:'),
              Text('9999'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const <Widget>[
              Text('Round:'),
              Text('999'),
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
