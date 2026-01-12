import 'package:rive/rive.dart';

class RiveAppController {
  RiveWidgetController? _riveController;

  void attach(RiveWidgetController controller) {
    _riveController = controller;
  }

  void dispose() {
    _riveController = null;
  }

  // --- ACTIONS ---

  void trigger(String inputName) {
    // 1. Get the trigger input
    final input = _riveController?.stateMachine?.trigger(inputName);
    // 2. Fire it
    input?.fire();
  }

  void setBool(String inputName, bool value) {
    // 1. Get the boolean input
    final input = _riveController?.stateMachine?.boolean(inputName);
    // 2. Set the value
    input?.value = value;
  }

  void setNumber(String inputName, double value) {
    // 1. Get the number input
    final input = _riveController?.stateMachine?.number(inputName);
    // 2. Set the value
    input?.value = value;
  }
}