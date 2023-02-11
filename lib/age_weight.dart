import 'package:flutter/material.dart';

class AgeWeight extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initialtValue;
  final int min;
  final int max;
  const AgeWeight({
    super.key,
    required this.onChange,
    required this.title,
    required this.initialtValue,
    required this.min,
    required this.max,
  });

  @override
  State<AgeWeight> createState() => _AgeWeightState();
}

class _AgeWeightState extends State<AgeWeight> {
  int counter=0;
  @override
  void initState() {
    super.initState();
    counter=widget.initialtValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    child:const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        if(counter > widget.min){
                          counter--;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                  const SizedBox(width: 15,),
                  Text(counter.toString(),textAlign: TextAlign.center,style:const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,

                  ),),
                  const SizedBox(width: 15,),
                  InkWell(
                    child:const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        if(counter < widget.max){
                          counter++;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
