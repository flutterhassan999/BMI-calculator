import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
class Gender extends StatefulWidget {
   final Function(int) onChange;
  const Gender({super.key,required this.onChange});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _gender=0;
  final ChoiceChip3DStyle selectedStyle=ChoiceChip3DStyle(
              topColor: Colors.grey.shade200,
              backColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),);
  final ChoiceChip3DStyle unSelectedStyle=ChoiceChip3DStyle(
              topColor: Colors.white,
              backColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),);            
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style:_gender == 1 ? selectedStyle : unSelectedStyle ,
            onSelected: (){
               setState(() {
                _gender=1;
              });
              widget.onChange(_gender);
            }, 
            onUnSelected: (){},
            selected:_gender==1,
            child: Column(
              children: [
                Image.asset('assets/men.png',width: 50,),
                const SizedBox(height: 6,),
                const Text('Male'),

            ],),
            ),
            const SizedBox(width: 20,),
             ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style:_gender == 2 ? selectedStyle : unSelectedStyle ,
            onSelected: (){
               setState(() {
                _gender=2;
              });
              widget.onChange(_gender);
            }, 
            onUnSelected: (){}, 
            selected:_gender==2,
            child: Column(
              children: [
                Image.asset('assets/women.png',width: 50,),
                const SizedBox(height: 6,),
                const Text('Female'),

            ],),
            ),
        ],
      ),
    );
  }
}