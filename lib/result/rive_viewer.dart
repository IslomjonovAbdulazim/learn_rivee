import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'rive_controller.dart';

class RiveViewer extends StatefulWidget {
  final String path;
  final Fit fit;
  final double? width;
  final double? height;
  final RiveAppController? controller;

  const RiveViewer({
    super.key,
    required this.path,
    this.fit = Fit.cover,
    this.width = 400,
    this.height = 400,
    this.controller,
  });

  @override
  State<RiveViewer> createState() => _RiveViewerState();
}

class _RiveViewerState extends State<RiveViewer> {
  // ⚡️ GLOBAL CACHE: Keeps files in memory for the whole app life
  static final Map<String, FileLoader> _globalCache = {};

  late final FileLoader _loader;

  @override
  void initState() {
    super.initState();

    // 1. Check if we already loaded this file before
    if (_globalCache.containsKey(widget.path)) {
      _loader = _globalCache[widget.path]!;
    } else {
      // 2. If not, load it and save it to the cache
      _loader = FileLoader.fromAsset(
        widget.path,
        riveFactory: Factory.rive,
      );
      _globalCache[widget.path] = _loader;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RiveWidgetBuilder(
        fileLoader: _loader,
        builder: (context, state) => switch (state) {
          RiveLoading() => const SizedBox(),
          RiveFailed() => const Icon(Icons.broken_image, color: Colors.red),
        // 🚀 Now this appears instantly because it's cached!
          RiveLoaded() => _buildLoaded(state.controller),
        },
      ),
    );
  }

  Widget _buildLoaded(RiveWidgetController riveCtrl) {
    widget.controller?.attach(riveCtrl);
    return RiveWidget(
      controller: riveCtrl,
      fit: widget.fit,
      alignment: Alignment.center,
    );
  }
}