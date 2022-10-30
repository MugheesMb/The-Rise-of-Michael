import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:game2/game2/Home.dart';
import 'package:game2/game2/bullet.dart';
import 'package:game2/world/ground.dart';

class Leenaa extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<Leena> {
  Leenaa() : super() {
    debugMode = false;
    anchor = Anchor.bottomCenter;
  }
  bool onGround = false;
  bool facingRight = true;
  bool hitRight = false;
  bool hitLeft = false;
  int _score = 0;
  int get score => _score;
  int _health = 500;
  int get health => _health;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (x > 0 && gameRef.velocity.x <= 0) {
      gameRef.velocity.x + gameRef.groundFriction;

      if (gameRef.velocity.x > 0) {
        gameRef.velocity.x = 0;
      }
    } else if (x < gameRef.mapWidth - width && gameRef.velocity.x >= 0) {
      gameRef.velocity.x -= gameRef.groundFriction;
      if (gameRef.velocity.x < 0) {
        gameRef.velocity.x = 0;
      }
    } else {
      gameRef.velocity.x = 0;
    }
  }

  @override
  void onCollision(intersectionPoints, other) {
    super.onCollision(intersectionPoints, other);
    if (other is Ground) {
      if (gameRef.velocity.y > 0) {
        if (intersectionPoints.length == 2) {
          var x1 = intersectionPoints.first[0];
          var x2 = intersectionPoints.last[0];
          if ((x1 - x2).abs() < 10) {
            gameRef.velocity.y = 100;
          } else {
            gameRef.velocity.y = 0;
            onGround = true;
          }
        }
      }
      if (gameRef.velocity.x != 0) {
        for (var points in intersectionPoints) {
          if (y - 5 >= points[1]) {
            // print('hit on sde');
            gameRef.velocity.x = 0;
            if (points[0] > x) {
              print('hit right');
              hitRight = true;
              hitLeft = false;
            } else {
              print('left');
              hitLeft = true;
              hitRight = false;
            }
          }
        }
      }
    }
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is RawKeyDownEvent &&
        !event.repeat &&
        event.logicalKey == LogicalKeyboardKey.space) {
      // pew pew!
      joystickAction();
    }

    return false;
  }

  @override
  void onCollisionEnd(other) {
    // TODO: implement onCollisionEnd
    super.onCollisionEnd(other);
    onGround = false;
    hitLeft = false;
    hitRight = false;
  }

  void joystickAction() {
    Bullet bullet = Bullet(
      sprite: gameRef.bulet,
      size: Vector2(74, 74),
      position: this.position.clone(),
    );

    // Anchor it to center and add to game world.
    bullet.anchor = Anchor.center;
    gameRef.add(bullet);

    // If multiple bullet is on, add two more
    // bullets rotated +-PI/6 radians to first bullet.
    // if (_shootMultipleBullets) {
    //   for (int i = -1; i < 2; i += 2) {
    //     Bullet bullet = Bullet(
    //       sprite: gameRef.spriteSheet.getSpriteById(28),
    //       size: Vector2(64, 64),
    //       position: position.clone(),
    //       level: _spaceship.level,
    //     );

    //     // Anchor it to center and add to game world.
    //     bullet.anchor = Anchor.center;
    //     bullet.direction.rotate(i * pi / 6);
    //     gameRef.add(bullet);
    //}
    //}
  }

  void addToScore(int points) {
    _score += points;
  }

  void reset() {
    this._score = 0;
    this._health = 500;
    this.position = gameRef.size / 2;
  }
}
