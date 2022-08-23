import 'dart:math';

class ResultBrain {
  ResultBrain({required this.height, required this.weight});
  int height;
  int weight;
  double bmi = 1;
  String bMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(2);
  }

  String bmiText() {
    if (bmi < 18) {
      return 'UnderWeight$bmi';
    } else if (bmi < 25) {
      return 'Normal';
    } else {
      return 'OverWeight';
    }
  }
}
