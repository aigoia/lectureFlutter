import 'package:flame/components.dart';
import 'package:hello_flame/manager/assets.dart';
import 'package:hello_flame/manager/main_game.dart';
import 'package:minisound/minisound.dart';

class Audio extends Component with HasGameRef<MainGame> {
  final engine = Engine();

  late final Sound popSound;

  @override
  Future<void> onLoad() async {
    engine.init();

    popSound = await engine.loadSoundAsset(AudioAssets.pop);

    engine.start();
    return super.onLoad();
  }
}