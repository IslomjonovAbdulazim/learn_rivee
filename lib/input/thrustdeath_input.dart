import 'package:flutter/material.dart';

class ThrustdeathInput extends StatefulWidget {
  const ThrustdeathInput({super.key});

  @override
  State<ThrustdeathInput> createState() => _ThrustdeathInputState();
}

class _ThrustdeathInputState extends State<ThrustdeathInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thrustdeath")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
