import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_rivee/result/rive_controller.dart';

import '../result/rive_viewer.dart';

class ScoreInput extends StatefulWidget {
  const ScoreInput({super.key});

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  final rive = RiveAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vilka")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RiveViewer(
                path: 'assets/input/score.riv',
                controller: rive,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("Final Score", 400);
                        rive.trigger("Start Animation");
                      },
                      child: Text("400"),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("Final Score", 650);
                        rive.trigger("Start Animation");
                      },
                      child: Text("650"),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("Final Score", 850);
                        rive.trigger("Start Animation");
                      },
                      child: Text("850"),
                    ),
                  ),

                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.setNumber("Final Score", 1000);
                        rive.trigger("Start Animation");
                      },
                      child: Text("1000"),
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
