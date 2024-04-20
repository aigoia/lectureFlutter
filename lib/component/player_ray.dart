import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';

import '../manager/config.dart';
import '../manager/main_game.dart';

class PlayerRay extends Component with HasGameRef<MainGame> {
  Vector2 direction = Vector2(1, 0);
  late Vector2 origin = gameRef.player.position + Config.playerSize * adjust;

  final adjust = 0.6;
  Paint paint = Paint()..color = Colors.red.withOpacity(0.6);
  RaycastResult<ShapeHitbox>? result;

  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    origin = gameRef.keyboard.move.x == 1 ? gameRef.player.position + Config.playerSize * adjust :
      gameRef.keyboard.move.x == -1 ? Vector2(
        gameRef.player.position.x - Config.playerSize.x * adjust,
        gameRef.player.position.y + Config.playerSize.y * adjust) : origin;

    direction = gameRef.keyboard.move.x != 0 ? gameRef.keyboard.move : direction;

    super.update(dt);
    final ray = Ray2(
      origin: origin,
      direction: direction,
    );
    result = gameRef.collisionDetection.raycast(
      ray,
      ignoreHitboxes: gameRef.player.hitBoxList,
    );
  }

  @override
  void render(Canvas canvas) {
    if (result != null && result!.isActive) {
      final originOffset = origin.toOffset();
      final intersectionPoint = result!.intersectionPoint!.toOffset();
      canvas.drawLine(originOffset, intersectionPoint, paint,);
      super.render(canvas);
    }
  }
}