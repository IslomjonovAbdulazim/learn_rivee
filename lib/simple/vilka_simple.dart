import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class VilkaSimple extends StatefulWidget {
  const VilkaSimple({super.key});

  @override
  State<VilkaSimple> createState() => _VilkaSimpleState();
}

class _VilkaSimpleState extends State<VilkaSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: RiveWidgetBuilder(
                  fileLoader: FileLoader.fromAsset(
                    "assets/simple/vilka.riv",
                    riveFactory: Factory.rive,
                  ),
                  builder: (context, state) => switch (state) {
                    RiveLoading() => const CircularProgressIndicator(),
                    RiveFailed() => Text('Error: ${state.error}'),
                    RiveLoaded() => RiveWidget(
                      controller: state.controller,
                      fit: Fit.cover,
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
