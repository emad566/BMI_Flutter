import 'package:bmi/shared/components.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.result, required this.age, required this.isFemale}) : super(key: key);
  final double result;
  final double age;
  final bool isFemale;

  String get healthPhrase{
    String str = '';
    if(result >= 30 ) {str = 'Over Weight';}
    else if(result > 25 && result < 30 ) {str = 'Normal';}
    else {str = 'Thin';}

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result'), centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LabelValue(label: 'Result', value: result.toStringAsFixed(2)),
          LabelValue(label: 'Health', value: healthPhrase),
          LabelValue(label: 'Age', value: age.toStringAsFixed(2)),
          LabelValue(label: 'Type', value: isFemale? 'Female' : 'Male'),
        ],
      ),
    );
  }
}
