import'package:flutter/material.dart';
class HeightWeight extends StatefulWidget {
  final Function(int) onChange;
  const HeightWeight({super.key,required this.onChange});

  @override
  State<HeightWeight> createState() => _HeightWeightState();
}

class _HeightWeightState extends State<HeightWeight> {
  int _height=145;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape:const RoundedRectangleBorder(),
        child: Column(
          children: [
            const Text('Height',style: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text(_height.toString(),
                style:const TextStyle(
                  fontSize: 38,
                ),
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                  fontSize: 19,
                  color: Colors.grey,
                  ),
                ),
              ],
            ),
            Slider(
              min:0,
              max:240,
              value:_height.toDouble(),
              thumbColor: Colors.blue,
              onChanged: (value){
                setState(() {
                  _height=value.toInt();
                });
                widget.onChange(_height);
              },
            ),
          ],
        ),
      ),
    );
  }
}