import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hello_flame/manager/assets.dart';
import 'package:hello_flame/manager/config.dart';
import 'package:hello_flame/manager/main_game.dart';

class PlayerAnimation extends SpriteAnimationGroupComponent
    with HasGameRef<MainGame>, CollisionCallbacks {

  @override
  Future<void> onLoad() async {
    current = PlayerState.idle;
    position = Config.playerInitPosition;
    priority = 1;

    final idleAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache(ImageAssets.idle),
      SpriteAnimationData.sequenced(
        amount: 7,
        stepTime: Config.playerStepTime,
        textureSize: Config.playerSize
      ),
    );

    final walkAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache(ImageAssets.walk),
      SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: Config.playerStepTime,
          textureSize: Config.playerSize
      ),
    );

    final trackAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache(ImageAssets.track),
      SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: Config.playerStepTime,
          textureSize: Config.playerSize
      ),
    );

    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.walk: walkAnimation,
      PlayerState.track: trackAnimation,
    };

    add(RectangleHitbox());
    return super.onLoad();
  }
}

enum PlayerState {idle, walk, track}