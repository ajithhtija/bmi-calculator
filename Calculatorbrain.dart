
import 'dart:math';
import 'package:flutter/cupertino.dart';
class CalculatorBrain{
    CalculatorBrain({@required this.weight,@required this.height});
    final int weight;
    final int height;
    double _bmi;
   String  getbmi()
   {
    _bmi = weight/pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
   }
  String  getresult()
  {
     _bmi = weight/pow(height / 100, 2);
     if(_bmi >= 25.0)
       return 'OverWeight';
     else if(_bmi >= 18.5)
        return 'Normal';
     else
       return 'UnderWeight';
  }
  String getinterpretation(){
     _bmi = weight/pow(height / 100, 2);
    if(_bmi >= 25)
      return 'You are higher than Normal Body Weight,Try to Exercise More';
    else if(_bmi > 18.5)
      return 'You have Normal body weight,Good Job';
    else
      return 'You have lower than Normal Body Weight,Eat a Bit more';
  }
}