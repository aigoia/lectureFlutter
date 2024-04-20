import 'package:flame/components.dart';

import '../manager/config.dart';
import 'player_animation.dart';


class PlayerMove extends PlayerAnimation {
  bool isFlip = false;

  @override
  void update(double dt) {
    if (gameRef.keyboard.move.x == -1 && isFlip == false) {
      flipHorizontallyAroundCenter();
      isFlip = true;
    }
    else if (gameRef.keyboard.move.x == 1 && isFlip == true ) {
      flipHorizontallyAroundCenter();
      isFlip = false;
    }

    super.current = gameRef.keyboard.move.x != 0 ? PlayerState.walk :
      gameRef.keyboard.isTrack ? PlayerState.track : PlayerState.idle;
    super.position.x += gameRef.keyboard.move.x * Config.playerSpeed;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (gameRef.keyboard.isTrack) {
      final contacted = gameRef.itemPosition.itemList.firstWhere((item) => item.position == other.position);

      if (!contacted.isVisible) {
        contacted.isVisible =  true;
        gameRef.audio.popSound.play();
      }

    }
    super.onCollision(intersectionPoints, other);
  }
}