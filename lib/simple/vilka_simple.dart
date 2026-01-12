import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../result/rive_service.dart';

class VilkaSimple extends StatefulWidget {
  const VilkaSimple({super.key});

  @override
  State<VilkaSimple> createState() => _VilkaSimpleState();
}

class _VilkaSimpleState extends State<VilkaSimple> {
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
                path: 'assets/input/thurtdeath.riv',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
