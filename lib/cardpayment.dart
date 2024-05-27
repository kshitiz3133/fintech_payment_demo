import 'dart:math';

import 'package:flutter/material.dart';

class CardPay extends StatefulWidget {
  const CardPay({Key? key}) : super(key: key);

  @override
  State<CardPay> createState() => _CardPayState();
}

class _CardPayState extends State<CardPay> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _animation=Tween(end: 1.0,begin: 0.0).animate(_controller)..addListener(() {setState(() {

    });})..addStatusListener((status) { _status=status;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(alignment: FractionalOffset.center,transform: Matrix4.identity()..setEntry(3,2,0.0015)..rotateY(pi*_animation.value),child: Card(child:
            _animation.value <=0.5?
            Container(height: 200,width: 300,color: Colors.blue,):
            Container(height: 200,width: 300,color: Colors.red,)
        )),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){if(_status==AnimationStatus.dismissed){
              _controller.forward();
            }
            else{
              _controller.reverse();
            }
            }, child:_animation.value <=0.5?
            Text("Enter CVV"):Text("Enter Card Details")
            ),
          ],
        ),
      ),
    );
  }
}
