import 'package:flame/game.dart';
import 'package:hello_flame/main.dart';

class Config {
  static final itemSize = Vector2.all(32);

  static final playerSize = Vector2.all(64);
  static const playerStepTime = 0.5;
  static final playerInitPosition = Vector2.all(412);
  static const playerSpeed = 2.0;

  static get sceneSize => customizeSize;
}

class Global {
  static const int score = 0;
}