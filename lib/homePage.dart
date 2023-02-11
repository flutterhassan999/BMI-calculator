// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/age_weight.dart';
import 'package:flutter_application_11/height_weight.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'score.dart';
import 'gender.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _gender = 0;
  int _height = 150;
  int _age=23;
  int _weight=51;
  bool _isFinished=false;
  double _bmiScore=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Calculate BMI'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  Gender(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWeight(onChange: (heightval) {
                    _height = heightval;
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeight(
                        onChange: (ageVal) {
                          _age=ageVal;
                        },
                        title: 'Age',
                        initialtValue: 23,
                        min: 0,
                        max: 100,
                      ),
                         AgeWeight(
                        onChange: (weightVal) {
                          _weight=weightVal;
                        },
                        title: 'Weight (Kg)',
                        initialtValue: 51,
                        min: 0,
                        max: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20,horizontal:58,),
                    child: SwipeableButtonView(
                      isFinished:_isFinished,
                      onFinish:() async{
                        await Navigator.push(context,
                          PageTransition(child: Score(
                            bmiScore: _bmiScore,
                            age: _age,
                          ), type: PageTransitionType.fade),
                        );
                        setState(() {
                          _isFinished=false;
                        });
                      },
                      onWaitingProcess:(){
                        calculateBmi();
                        Future.delayed(const Duration(seconds:1),(){
                          setState((){
                            _isFinished=true;
                          });
                        });
                      },
                      activeColor:Colors.blue,
                      buttonWidget:const Icon(Icons.arrow_forward_ios_rounded,),
                      buttonText:'CALCULATE',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void calculateBmi(){
    _bmiScore=_weight/pow(_height/100,2);
  }
}
