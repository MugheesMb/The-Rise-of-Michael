import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game2/game2/Home.dart';
import 'package:game2/game2/bullet.dart';
import 'package:game2/models/enemy_details.dart';

// This represents an enemy in the game world.
class Enemy extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<Leena> {
  // The data required for creation of this enemy.
  final EnemyData enemyData;

  Enemy(this.enemyData) {
    animation = SpriteAnimation.fromFrameData(
      enemyData.image,
      SpriteAnimationData.sequenced(
        amount: enemyData.nFrames,
        stepTime: enemyData.stepTime,
        textureSize: enemyData.textureSize,
      ),
    );
  }

  @override
  void onMount() {
    // Reduce the size of enemy as they look too
    // big compared to the dino.
    size *= 0.5;
    // Add a hitbox for this enemy.
    add(
      RectangleHitbox.relative(
        Vector2.all(0.8),
        parentSize: size,
        position: Vector2(size.x * 0.2, size.y * 0.2) / 2,
      ),
    );
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Bullet) {
      other.removeFromParent();
      removeFromParent();
    }
  }

  @override
  void update(double dt) {
    position.x -= enemyData.speedX * dt;

    // Remove the enemy and increase player score
    // by 1, if enemy has gone past left end of the screen.
    if (position.x < -enemyData.textureSize.x) {
      removeFromParent();
    }

    super.update(dt);
  }
}
