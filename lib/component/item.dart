import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../manager/assets.dart';
import '../manager/config.dart';
import '../manager/main_game.dart';


class Item extends SpriteGroupComponent<ItemType>
    with HasGameRef<MainGame>, CollisionCallbacks, HasVisibility {
  final ItemType itemType;
  final Vector2 itemPosition;

  Item({
    required this.itemType,
    required this.itemPosition,
  });

  @override
  Future<void> onLoad() async {
    current = itemType;
    position = itemPosition;
    size = Config.itemSize;
    priority = 2;

    sprites = {
      ItemType.fruit: Sprite(game.images.fromCache(ImageAssets.fruit)),
      ItemType.mushroom: Sprite(game.images.fromCache(ImageAssets.mushroom)),
    };

    add(RectangleHitbox());
    return super.onLoad();
  }
}

enum ItemType {fruit, mushroom}