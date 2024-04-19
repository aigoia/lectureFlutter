import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/services.dart';

class Keyboard extends Component with KeyboardHandler {
  Vector2 move = Vector2(0, 0);
  bool isTrack = false;
  final Vector2 right = Vector2(1, 0);
  final Vector2 left = Vector2(-1, 0);

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isEscape = keysPressed.contains(LogicalKeyboardKey.escape);
    if (isEscape) SystemNavigator.pop();

    final isLeft = keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
      keysPressed.contains(LogicalKeyboardKey.keyA);
    final isRight = keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
        keysPressed.contains(LogicalKeyboardKey.keyD);
    move = isLeft ? left : isRight ? right : Vector2.zero();

    isTrack = keysPressed.contains(LogicalKeyboardKey.arrowDown) ||
      keysPressed.contains(LogicalKeyboardKey.keyS);

    return super.onKeyEvent(event, keysPressed);
  }
}