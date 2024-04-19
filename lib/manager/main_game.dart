import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:hello_flame/component/background.dart';
import 'package:hello_flame/component/item_position.dart';
import 'package:hello_flame/component/player_animation.dart';
import 'package:hello_flame/component/player_move.dart';
import 'package:hello_flame/component/player_ray.dart';
import 'package:hello_flame/manager/audio.dart';
import 'package:hello_flame/manager/keyboard.dart';

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
      PlayerRay(),
      audio = Audio(),
      keyboard = Keyboard(),
      // Background(),
      player = PlayerMove(),
      itemPosition = ItemPosition(),
    ]);
    return super.onLoad();
  }
}