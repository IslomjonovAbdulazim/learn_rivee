import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveViewer extends StatefulWidget {
  final String path;
  final Fit fit;
  final double width;  // Added
  final double height; // Added

  const RiveViewer({
    super.key,
    required this.path,
    this.fit = Fit.cover,
    this.width = 400,         // Optional input
    this.height = 400,        // Optional input
  });

  @override
  State<RiveViewer> createState() => _RiveViewerState();
}

class _RiveViewerState extends State<RiveViewer> {
  late final FileLoader _loader;

  @override
  void initState() {
    super.initState();
    // Initialize the loader once to prevent reloading/flickering
    _loader = FileLoader.fromAsset(
      widget.path,
      riveFactory: Factory.rive,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,   // Apply width if provided
      height: widget.height, // Apply height if provided
      child: RiveWidgetBuilder(
        fileLoader: _loader,
        builder: (context, state) => switch (state) {
          RiveLoading() => const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),

          RiveFailed() => Center(
            child: Text(
              'Error: ${state.error}',
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),

          RiveLoaded() => RiveWidget(
            controller: state.controller,
            fit: widget.fit,
            alignment: Alignment.center,
          ),
        },
      ),
    );
  }
}