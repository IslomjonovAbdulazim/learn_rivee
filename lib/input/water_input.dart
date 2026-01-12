import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_rivee/result/rive_controller.dart';
import 'package:learn_rivee/result/rive_viewer.dart';

class WaterInput extends StatefulWidget {
  const WaterInput({super.key});

  @override
  State<WaterInput> createState() => _WaterInputState();
}

class _WaterInputState extends State<WaterInput> {
  bool waterOn = false;
  final rive = RiveAppController();

  @override
  void dispose() {
    rive.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Water")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              RiveViewer(
                path: "assets/input/water.riv",
                controller: rive,
              ),
              Spacer(),
              CupertinoButton(
                onPressed: () {
                  waterOn = !waterOn;
                  rive.setBool("water on", waterOn);
                },
                child: Text("Press"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
