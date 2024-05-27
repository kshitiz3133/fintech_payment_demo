import 'package:fintech_payment_demo/cardpayment.dart';
import 'package:fintech_payment_demo/home.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Activator extends StatefulWidget {
  const Activator({Key? key}) : super(key: key);

  @override
  State<Activator> createState() => _ActivatorState();
}

class _ActivatorState extends State<Activator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Vault is Not Activated",
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                    onPressed: () {
                      LaunchApp.openApp(
                        androidPackageName: 'com.example.fintech_vault_app',
                        openStore: false,
                      );
                    },
                    child: Text("Activate Vaul")),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            payment(context),
          ],
        ),
      ),
    );
  }
}

Widget payment(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pay",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 400,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CardPay()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0.1,
                            blurRadius: 2)
                      ]),
                    child: Center(child: Text("Card Payment",style: TextStyle(fontSize: 25),)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0.1,
                            blurRadius: 2)
                      ]),
                    child: Center(child: Text("Send Money",style: TextStyle(fontSize: 28),)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0.1,
                          blurRadius: 2)
                    ]),
                  child: Center(child: Text("Self Transfer",style: TextStyle(fontSize: 25),)),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
