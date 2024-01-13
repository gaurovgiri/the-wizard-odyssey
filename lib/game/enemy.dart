import 'dart:async';

import 'package:flame/components.dart';
import 'package:runner/game/game.dart';

class Enemy extends SpriteAnimationComponent with HasGameRef<RunnerGame> {
  Enemy() {
    size = Vector2(250, 300);
  }

  @override
  Future<void> onLoad() async {
    animation = await SpriteAnimation.load(
      'Goblin/Run.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2(150, 150),
        stepTime: 0.1,
      ),
    );
    position = Vector2(gameRef.size.x + size.x, size.y - 150);
    flipHorizontally();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= dt * 200;
    if (position.x < -size.x) {
      position.x = gameRef.size.x + size.x;
    }
  }
}
