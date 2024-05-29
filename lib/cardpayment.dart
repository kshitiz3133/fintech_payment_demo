import 'dart:math';
import 'package:flutter/material.dart';

class CardPay extends StatefulWidget {
  const CardPay({Key? key}) : super(key: key);

  @override
  State<CardPay> createState() => _CardPayState();
}

class _CardPayState extends State<CardPay> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 5),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 80,
                                child: Image(
                                  image: AssetImage("assets/chip.jpg"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 18,
                                  width: 250,
                                  child: TextField(
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Text(
                                "Card Number",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Exp Date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  SizedBox(
                                    width: 25,
                                    child: TextField(
                                      maxLength: 2,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    "/",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 25,
                                    child: TextField(
                                      maxLength: 2,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
                    : Container(
                  height: 210,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        color: Colors.black,
                        width: 300,
                        height: 40,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateY(pi),
                            child: Row(
                              children: [
                                IconButton(onPressed: (){
                                  _controller.reverse();
                                }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                                SizedBox(width: 10,),
                                const Text(
                                  "CVV",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(width: 10,),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    maxLength: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _animation.value <= 0.5?
            ElevatedButton(
              onPressed: () {
                  _controller.forward();
              },
              child: Text("Enter CVV"),
            ):
            ElevatedButton(
              onPressed: () {
                print("Submitted");
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

