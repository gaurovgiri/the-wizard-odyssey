import 'dart:math';

import 'package:flame/components.dart';
import 'package:runner/game/enemy.dart';
import 'package:runner/game/game.dart';

class EnemyManager extends Component with HasGameReference<RunnerGame> {
  final Random random = Random();
  final Timer _timer = Timer(2, repeat: true);

  EnemyManager() {
    _timer.onTick = _spawnEnemy;
  }

  void _spawnEnemy() {
    final enemy = Enemy(EnemyType.values[random.nextInt(4)]);
    game.add(enemy);
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
