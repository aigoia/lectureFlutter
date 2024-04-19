import 'package:flame/components.dart';
import 'package:hello_flame/component/item.dart';
import 'package:hello_flame/manager/main_game.dart';

class ItemPosition extends PositionComponent with HasGameRef<MainGame> {
  final itemList = [
    Item(itemType: ItemType.mushroom, itemPosition: Vector2(128, 440)),
    Item(itemType: ItemType.fruit, itemPosition: Vector2(768, 440)),
    Item(itemType: ItemType.mushroom, itemPosition: Vector2(1120, 440)),
  ];

  @override
  Future<void> onLoad() async {
    addAll(itemList);
    // for (var element in itemList) {element.isVisible = false;}
    return super.onLoad();
  }
}