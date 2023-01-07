import 'dart:math';

/// This class is respnsible for game logic.
class GameModel {
  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 1;
  static const maxScore = 100;

  int target;
  int current;
  int totalScore;
  int round;

  GameModel(this.target,
      [this.current = sliderStart,
      this.totalScore = scoreStart,
      this.round = roundStart]);

  int roundScore() {
    final diff = _diff();

    var bonus = 0;
    if (diff == 0) {
      bonus = 100;
    } else if (diff == 1) {
      bonus = 50;
    } // else no bonus to add.

    var newScore = maxScore - diff;

    return newScore + bonus;
  }

  int _diff() => (current - target).abs();

  void updateTotalScore() {
    totalScore += roundScore();
  }

  void nextRound({required int target}) {
    this.target = target;
    round++;
  }

  String summaryTitle() {
    var diff = _diff();

    if (diff == 0) {
      return 'Perfect!';
    } else if (diff < 5) {
      return 'You almost had it!';
    } else if (diff <= 10) {
      return 'Not bad.';
    }

    return 'Are you even trying?.';
  }

  static int nextTargetValue() {
    return Random().nextInt(100) + 1;
  }
}
