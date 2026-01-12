import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_rivee/result/rive_controller.dart';

import '../result/rive_viewer.dart';

class FireworksJctoon extends StatefulWidget {
  const FireworksJctoon({super.key});

  @override
  State<FireworksJctoon> createState() => _FireworksJctoonState();
}

class _FireworksJctoonState extends State<FireworksJctoon> {
  final rive = RiveAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fireworks")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RiveViewer(
                path: 'assets/jctoon/fireworks.riv',
                controller: rive,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("NumFireworks", 10);
                      },
                      child: Text("10"),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("NumFireworks", 40);
                      },
                      child: Text("40"),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("NumFireworks", 100);
                      },
                      child: Text("100"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
