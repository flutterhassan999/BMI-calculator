import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class Score extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  Score({super.key, required this.bmiScore, required this.age});

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your BMI Score',
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  const Text(
                    'Your BMI is',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrettyGauge(
                    gaugeSize: 300,
                    minValue: 0,
                    maxValue: 40,
                    segments: [
                      GaugeSegment('Underweight', 19.5, Colors.red),
                      GaugeSegment('Normal', 6.5, Colors.green),
                      GaugeSegment('Overweight', 5, Colors.pink),
                      GaugeSegment('Obsesweight', 10.1, Colors.orange),
                    ],
                    valueWidget: Text(
                      bmiScore.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    currentValue: bmiScore.toDouble(),
                    needleColor: Colors.blueGrey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    bmiStatus!,
                    style: TextStyle(
                      fontSize: 20,
                      color: bmiStatusColor!,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    bmiInterpretation!,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.black87,
                        ),
                        child:const Text(
                          'Again Calculate',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Share.share(
                              'Your BMI is ${bmiScore.toStringAsFixed(2)} at age $age');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.black87,
                        ),
                        child:const Text(
                          'Share',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = 'Obese';
      bmiInterpretation = 'To Look Healthy Please!!Reduce Weight.';
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 25) {
      bmiStatus = 'OverWeight';
      bmiInterpretation = 'Overweight! Do regular exercise.';
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 18.5) {
      bmiStatus = 'Normal';
      bmiInterpretation = 'WOW! you are healthy person';
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = 'UnderWeight';
      bmiInterpretation = 'Eat,eat to remain fit';
      bmiStatusColor = Colors.red;
    }
  }
}
