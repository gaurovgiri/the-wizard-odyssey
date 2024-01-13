import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:runner/game/game.dart';

enum EnemyType { Goblin, FlyingEye, Mushroom, Skeleton }

class Enemy extends SpriteAnimationComponent
    with HasGameRef<RunnerGame>, CollisionCallbacks {
  static const Map<EnemyType, String> actionMap = {
    EnemyType.Goblin: 'Run',
    EnemyType.FlyingEye: 'Flight',
    EnemyType.Mushroom: 'Run',
    EnemyType.Skeleton: 'Walk',
  };

  final EnemyType type;
  Enemy(this.type) {
    size = Vector2(250, 300);
  }

  @override
  Future<void> onLoad() async {
    animation = await SpriteAnimation.load(
      '${type.name}/${actionMap[type]}.png',
      SpriteAnimationData.sequenced(
        amount: type == EnemyType.Skeleton ? 4 : 8,
        textureSize: Vector2(150, 150),
        stepTime: 0.1,
      ),
    );
    position = Vector2(
        gameRef.size.x + size.x,
        size.y -
            (actionMap[type] == 'Flight'
                ? Random().nextBool()
                    ? 250
                    : 150
                : 150));

    await add(RectangleHitbox(
        position: Vector2(size.x / 2, size.y / 2),
        size: size * 0.2,
        anchor: Anchor.center));
    flipHorizontally();

    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= dt * 200;
  }

  bool destroy() {
    return position.x < -size.x;
  }
}
