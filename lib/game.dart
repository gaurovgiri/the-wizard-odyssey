// Class where the world is defined.
import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';

class RunnerGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    final wizard = SpriteAnimationComponent();

    final idleAnimation = await loadSpriteAnimation(
      'Idle.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2(150, 150),
        stepTime: 0.1,
      ),
    );

    final moveAnimation = await loadSpriteAnimation(
      'Move.png',
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2(150, 150),
        stepTime: 0.1,
      ),
    );

    final attackAnimation = await loadSpriteAnimation(
        'Attack.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(150, 150),
        ));

    wizard
      ..animation = moveAnimation
      ..position = Vector2(size.x / 50, size.y - 250)
      ..size = Vector2(250, 300);

    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('parallax/1.png'),
        ParallaxImageData('parallax/4.png'),
        ParallaxImageData('parallax/3.png'),
        ParallaxImageData('parallax/2.png'),
        ParallaxImageData('parallax/5.png')
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.5, 1.0),
    );

    add(parallax);
    add(wizard);

    return super.onLoad();
  }
}
