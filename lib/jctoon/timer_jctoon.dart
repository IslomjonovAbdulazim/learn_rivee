import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_rivee/result/rive_controller.dart';
import 'package:learn_rivee/result/rive_viewer.dart';

class TimerJcToon extends StatefulWidget {
  const TimerJcToon({super.key});

  @override
  State<TimerJcToon> createState() => _TimerJcToonState();
}

class _TimerJcToonState extends State<TimerJcToon> {
  final rive = RiveAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              RiveViewer(path: "assets/jctoon/timer.riv", controller: rive),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.trigger("Start");
                      },
                      child: Text("Start"),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.trigger("Stop");
                      },
                      child: Text("Stop"),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: () {
                        rive.trigger("Reset");
                      },
                      child: Text("Reset"),
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
