import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_rivee/input/score_input.dart';
import 'package:learn_rivee/input/thrustdeath_input.dart';
import 'package:learn_rivee/jctoon/fireworks_jctoon.dart';
import 'package:learn_rivee/jctoon/timer_jctoon.dart';
import 'package:learn_rivee/input/water_input.dart';
import 'package:learn_rivee/simple/vilka_simple.dart';
import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveNative.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final simple = [
    ("Vilka", VilkaSimple()),
  ];

  final input = [
    ("Thurstdeath", ThrustdeathInput()),
    ("Water", WaterInput()),
    ("Score", ScoreInput()),
  ];

  final jcToon = [
    ("Timer", TimerJcToon()),
    ("Fireworks", FireworksJctoon()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rive Examples'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'JC Toon'),
              Tab(text: 'Input'),
              Tab(text: 'Simple'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Input Tab
            ListView.builder(
              itemCount: jcToon.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(jcToon[index].$2);
                  },
                  title: Text(jcToon[index].$1),
                );
              },
            ),

            ListView.builder(
              itemCount: input.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(input[index].$2);
                  },
                  title: Text(input[index].$1),
                );
              },
            ),

            // Simple Tab
            ListView.builder(
              itemCount: simple.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(simple[index].$2);
                  },
                  title: Text(simple[index].$1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
