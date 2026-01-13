import 'package:rive/rive.dart' as rive; // 1. Use 'as rive' to avoid naming conflicts
import 'package:rive/rive.dart';

class RiveAppController {
  RiveWidgetController? _riveController;

  // 👂 Updated Listener: We pass the event Name and the raw Event object
  Function(String eventName, rive.Event event)? onEvent;

  void attach(RiveWidgetController controller) {
    _riveController = controller;

    // 2. Correct Class Name: rive.Event
    _riveController?.stateMachine?.addEventListener(_handleRiveEvent);
  }

  void dispose() {
    _riveController?.stateMachine?.removeEventListener(_handleRiveEvent);
    _riveController = null;
    onEvent = null;
  }

  // 3. Fix: Use 'rive.Event' instead of 'RiveEvent'
  void _handleRiveEvent(rive.Event event) {
    if (onEvent != null) {
      // 4. Pass it to your UI
      onEvent!(event.name, event);
    }
  }

  // --- ACTIONS ---

  void trigger(String inputName) {
    // Note: In 0.14.x, we assume the input exists.
    // If you need safety, check 'controller.inputs' documentation.
    final input = _riveController?.stateMachine?.trigger(inputName);
    input?.fire();
  }

  void setBool(String inputName, bool value) {
    final input = _riveController?.stateMachine?.boolean(inputName);
    input?.value = value;
  }

  void setNumber(String inputName, double value) {
    final input = _riveController?.stateMachine?.number(inputName);
    input?.value = value;
  }
}