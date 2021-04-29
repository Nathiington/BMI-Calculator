import 'dart:math';

class Functinality {
  final int height;
  final int weight;
  double _bmi;

  Functinality({this.height, this.weight});

  String calculate() {
    _bmi = weight / pow(height/100, 2);

    return _bmi.toStringAsFixed(2);
  }

  String getResults() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
     if (_bmi >= 25.0) {
      return 'You have a higher than normal body weight';
    } else if (_bmi > 18.5) {
      return 'Healthy body weight for your demographic';
    } else {
      return 'You have a lower than normal body weight';
    }
  }
}
