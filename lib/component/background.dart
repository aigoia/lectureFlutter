import 'package:flame/components.dart';
import 'package:hello_flame/manager/assets.dart';
import 'package:hello_flame/manager/main_game.dart';

class Background extends SpriteComponent with HasGameRef<MainGame> {

  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache(ImageAssets.map));
    size = gameRef.size;
    priority = 0;
    return super.onLoad();
  }

  @override
  void onMount() {
    // gameRef.audio.popSound.play();
    super.onMount();
  }
}