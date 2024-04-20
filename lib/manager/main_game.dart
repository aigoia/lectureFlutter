import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../component/background.dart';
import '../component/item_position.dart';
import '../component/player_move.dart';
import 'audio.dart';
import 'keyboard.dart';


class MainGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  late final Audio audio;
  late final Keyboard keyboard;
  late final ItemPosition itemPosition;
  late final PlayerMove player;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    addAll([
      // PlayerRay(),
      audio = Audio(),
      keyboard = Keyboard(),
      Background(),
      player = PlayerMove(),
      itemPosition = ItemPosition(),
    ]);
    return super.onLoad();
  }
}