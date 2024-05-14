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
      body: Center(
        child: ElevatedButton(onPressed: (){
          LaunchApp.openApp(
            androidPackageName: 'com.example.fintech_vault_app',
            openStore: false,
          );

        }, child: Text("Activate Vaul")),
      ),
    );
  }
}
