import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:runner/game/game.dart';

enum WizardState {
  idle,
  move,
  attack,
}

class Wizard extends SpriteAnimationComponent with HasGameRef<RunnerGame> {
  Map<WizardState, SpriteAnimation> animationMap = {};
  WizardState state = WizardState.idle;
  Wizard() {
    size = Vector2(250, 300);
  }

  @override
  Future<void> onLoad() async {
    animationMap = {
      WizardState.idle: await SpriteAnimation.load(
        'Idle.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          textureSize: Vector2(150, 150),
          stepTime: 0.1,
        ),
      ),
      WizardState.move: await SpriteAnimation.load(
        'Move.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          textureSize: Vector2(150, 150),
          stepTime: 0.1,
        ),
      ),
      WizardState.attack: await SpriteAnimation.load(
          'Attack.png',
          SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: 0.1,
            textureSize: Vector2(150, 150),
          )),
    };

    animation = animationMap[WizardState.idle];
    position = Vector2(size.x / 50, size.y - 150);
    size = Vector2(250, 300);

    return super.onLoad();
  }

  void move() {
    state = WizardState.move;
    animation = animationMap[state];
  }

  void attack() {
    state = WizardState.attack;
    animation = animationMap[state];
  }

  void idle() {
    state = WizardState.idle;
    animation = animationMap[state];
  }
}
