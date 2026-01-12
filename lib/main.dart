import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_rivee/input/thrustdeath_input.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rive Examples'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Simple'),
              Tab(text: 'Input'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
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
            // Input Tab
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
          ],
        ),
      ),
    );
  }
}
