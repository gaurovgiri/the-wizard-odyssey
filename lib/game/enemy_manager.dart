import 'dart:math';

import 'package:flame/components.dart';
import 'package:runner/game/enemy.dart';
import 'package:runner/game/game.dart';

class EnemyManager extends Component with HasGameReference<RunnerGame> {
  final Random random = Random();
  final Timer _timer = Timer(4, repeat: true);

  EnemyManager() {
    _timer.limit = random.nextDouble() * 4;
    _timer.onTick = _spawnEnemy;
  }

  void _spawnEnemy() {
    final enemy = Enemy(EnemyType.values[random.nextInt(4)]);
    game.world.add(enemy);
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
  }

  @override
  void update(t) {
    super.update(t);
    _timer.update(t);
  }
}
