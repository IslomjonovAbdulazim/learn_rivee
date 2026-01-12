import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'rive_controller.dart'; // Import your controller

class RiveViewer extends StatefulWidget {
  final String path;
  final Fit fit;
  final double? width;
  final double? height;
  final RiveAppController? controller; // <--- ADDED THIS

  const RiveViewer({
    super.key,
    required this.path,
    this.fit = Fit.cover,
    this.width = 400,
    this.height = 400,
    this.controller, // <--- Accept it here
  });

  @override
  State<RiveViewer> createState() => _RiveViewerState();
}

class _RiveViewerState extends State<RiveViewer> {
  late final FileLoader _loader;

  @override
  void initState() {
    super.initState();
    _loader = FileLoader.fromAsset(
      widget.path,
      riveFactory: Factory.rive,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RiveWidgetBuilder(
        fileLoader: _loader,
        builder: (context, state) => switch (state) {
          RiveLoading() => const SizedBox(), // Keep it clean
          RiveFailed() => const Icon(Icons.broken_image),

          RiveLoaded() => _buildLoaded(state.controller),
        },
      ),
    );
  }

  // Helper to connect the controller cleanly
  Widget _buildLoaded(RiveWidgetController riveCtrl) {
    // MAGIC: We connect the user's controller to the actual Rive engine
    widget.controller?.attach(riveCtrl);

    return RiveWidget(
      controller: riveCtrl,
      fit: widget.fit,
      alignment: Alignment.center,
    );
  }
}