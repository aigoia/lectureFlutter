import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:hello_flame/manager/main_game.dart';

const Size customizeSize = Size(640, 360);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setWindowSize(customizeSize);

  final mainGame = MainGame();
  runApp(GameWidget(game: mainGame));
}