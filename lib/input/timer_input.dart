import 'package:flutter/material.dart';
import 'package:learn_rivee/result/rive_controller.dart';

import '../result/rive_viewer.dart';

class TimerInput extends StatefulWidget {
  const TimerInput({super.key});

  @override
  State<TimerInput> createState() => _TimerInputState();
}

class _TimerInputState extends State<TimerInput> {
  final rive = RiveAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer by Me")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RiveViewer(
                path: 'assets/input/timer_me.riv',
                controller: rive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
