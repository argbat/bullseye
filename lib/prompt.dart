import 'package:bullseye/text_styles.dart';
import 'package:flutter/material.dart';

class Prompt extends StatelessWidget {
  const Prompt({super.key, required this.targetValue});

  final int targetValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'PUT THE NULLSEYE AS CLOSE AS YOU CAN',
          style: LabelTextStyle.bodyText1(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$targetValue',
            style: TargetTextStyle.bodyText1(context),
          ),
        )
      ],
    );
  }
}
