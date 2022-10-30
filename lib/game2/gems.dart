import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'package:game2/game2/Home.dart';
import 'package:game2/game2/command.dart';
import 'package:game2/game2/player.dart';
import 'package:tiled/tiled.dart';

class Gem extends SpriteComponent with CollisionCallbacks, HasGameRef<Leena> {
  final TiledObject tiledObject;
  Gem({required this.tiledObject});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    print(tiledObject.id);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    print('hit gem');
    if (other is Leenaa) {
      removeFromParent();
      final command = Command<Leenaa>(action: (player) {
        // Use the correct killPoint to increase player's score.
        player.addToScore(1);
      });
      gameRef.addCommand(command);
    }
    super.onCollision(intersectionPoints, other);
  }

  void reset() {
    tiledObject;
  }
}
