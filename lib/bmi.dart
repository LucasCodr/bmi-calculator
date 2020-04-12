import 'dart:math';

class BMI {

  final int height;
  final int weight;

  double _bmi;

  BMI({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {

    if (_bmi >= 25) {
      return 'Acima do Peso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do Peso';
    }
  }

  String getInterpretation() {

    if (_bmi >= 25) {
      return 'Seu peso corporal está acima do normal. Procure fazer mais exercícios e comer menos BESTEIRAS.';
    } else if (_bmi > 18.5) {
      return 'Seu peso corporal é normal. Continue assim!';
    } else {
      return 'Seu peso corporal está abaixo do normal. Procure comer um pouco mais!';
    }
  }
}