import 'package:flame/components.dart';
import 'package:runner/game/game.dart';

enum WizardState {
  idle,
  move,
  attack,
}

class Wizard extends SpriteAnimationComponent with HasGameRef<RunnerGame> {
  Map<WizardState, SpriteAnimation> animationMap = {};
  WizardState state = WizardState.idle;

  double speedY = 0.0;
  double gravity = 1000.0;

  double ymax = 0;

  Wizard() {
    size = Vector2(250, 300);
  }

  @override
  Future<void> onLoad() async {
    animationMap = {
      WizardState.idle: await SpriteAnimation.load(
        'Player/Idle.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          textureSize: Vector2(150, 150),
          stepTime: 0.1,
        ),
      ),
      WizardState.move: await SpriteAnimation.load(
        'Player/Move.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          textureSize: Vector2(150, 150),
          stepTime: 0.1,
        ),
      ),
      WizardState.attack: await SpriteAnimation.load(
          'Player/Attack.png',
          SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: 0.1,
            textureSize: Vector2(150, 150),
          )),
    };

    animation = animationMap[WizardState.move];
    size = Vector2(250, 300);
    position = Vector2(size.x / 50, size.y - 150);
    ymax = size.y - 150;

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

  void jump() {
    if (onGround()) {
      speedY = -500;
    }
  }

  bool onGround() {
    return position.y >= ymax;
  }

  @override
  void update(double dt) {
    super.update(dt);
    speedY += gravity * dt;
    position.y += speedY * dt;

    if (onGround()) {
      position.y = ymax;
      speedY = 0.0;
      move();
    } else {
      idle();
    }
  }
}
