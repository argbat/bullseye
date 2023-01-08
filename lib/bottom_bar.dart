import 'package:flutter/material.dart';
import 'package:bullseye/text_styles.dart';
import 'style_button.dart';
import 'about.dart';

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
        StyleButton(
          icon: Icons.refresh,
          onPressed: () {
            onStartOver();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Score',
                  style: LabelTextStyle.bodyText1(context),
                ),
                Text(
                  '$totalScore',
                  style: ScoreNumberTextStyle.headline4(context),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Round',
                  style: LabelTextStyle.bodyText1(context),
                ),
                Text(
                  '$round',
                  style: ScoreNumberTextStyle.headline4(context),
                ),
              ],
            ),
          ),
        ),
        StyleButton(
          icon: Icons.info,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
