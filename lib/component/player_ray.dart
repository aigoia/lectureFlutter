import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:hello_flame/manager/main_game.dart';

class PlayerRay extends Component with HasGameRef<MainGame> {
  final direction = Vector2(1, 0);
  Paint paint = Paint()..color = Colors.red.withOpacity(0.5);
  RaycastResult<ShapeHitbox>? result;

  @override
  Future<void> onLoad() async {
    add(ScreenHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    final ray = Ray2(
      origin: gameRef.player.position,
      direction: direction,
    );
    result = gameRef.collisionDetection.raycast(ray);
  }

  @override
  void render(Canvas canvas) {
    if (result != null && result!.isActive) {
      final originOffset = gameRef.player.position.toOffset();
      final intersectionPoint = result!.intersectionPoint!.toOffset();
      canvas.drawLine(originOffset, intersectionPoint, paint,);
      canvas.drawCircle(originOffset, 10, paint);
      super.render(canvas);
    }
  }
}