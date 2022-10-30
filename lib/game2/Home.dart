import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:game2/game2/command.dart';
import 'package:game2/game2/enemyManger.dart';
import 'package:game2/game2/gems.dart';
import 'package:game2/game2/intro.dart';
import 'package:game2/game2/player.dart';
import 'package:game2/widgets/pause.dart';
import 'package:game2/widgets/pause_menu.dart';

import 'package:game2/world/ground.dart';
import 'package:tiled/tiled.dart';

class Leena extends FlameGame
    with HasCollisionDetection, HasDraggables, HasTappables {
  static const _imageAssets = [
    'enem.png',
  ];
  Leenaa leen = Leenaa();
  Leenaa leen2 = Leenaa();
  late Gem gem;
  late Sprite bulet;
  final double gravity = 3.8;
  final double gravity1 = 1.8;
  final double pushSpeed = 25;
  final double jumpForce = 120;
  final double groundFriction = .52;
  late Sprite _sprite;
  Vector2 velocity = Vector2(0, 0);
  late TiledComponent homeMap;
  late SpriteAnimation runlina;
  late SpriteAnimation runlina2;
  late SpriteAnimation runlina3;
  late double mapWidth;
  late TextComponent playerScore;
  late TextComponent PlayerHealth;
  late EnemyManager _enemyManager;
  late var gemGroup;
  late Intro intro;
  bool introFinished = false;
  final _commandList = List<Command>.empty(growable: true);
  late Sprite dadS;

  // List of commands to be processed in next update.
  final _addLaterCommandList = List<Command>.empty(growable: true);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await images.loadAll(_imageAssets);
    bulet = await loadSprite('slash.png');
    _sprite = await loadSprite('aqua.gif');

    homeMap = await TiledComponent.load('map3.tmx', Vector2.all(32));
    add(homeMap);

    mapWidth = 32.0 * homeMap.tileMap.map.width;
    double mapHeight = 32.0 * homeMap.tileMap.map.height;

    var obstacleGroup = homeMap.tileMap.getLayer<ObjectGroup>('ground');

    for (final obj in obstacleGroup!.objects) {
      add(Ground(
          size: Vector2(obj.width, obj.height),
          position: Vector2(obj.x, obj.y)));
    }

    gemGroup = homeMap.tileMap.getLayer<ObjectGroup>('gems');

    for (final gem in gemGroup!.objects) {
      add(Gem(tiledObject: gem)
        ..sprite = await loadSprite('gems/star.png')
        ..position = Vector2(gem.x, gem.y - gem.height)
        ..size = Vector2(gem.width, gem.height));
    }

    // camera.viewport = FixedResolutionViewport(Vector2(mapWidth, mapHeight));
    camera.viewport = FixedResolutionViewport(Vector2(1280, mapHeight));

    final spriteSheetmb = SpriteSheet(
      image: await images.load('mb1.png'),
      srcSize: Vector2(750, 900),
    );
    final spriteSheetmb2 = SpriteSheet(
      image: await images.load('idl.png'),
      srcSize: Vector2(750, 900),
    );
    final spriteSheetmb3 = SpriteSheet(
      image: await images.load('dance.png'),
      srcSize: Vector2(750, 892),
    );
    runlina = spriteSheetmb.createAnimation(row: 0, stepTime: 0.1, to: 7);
    runlina2 = spriteSheetmb2.createAnimation(row: 0, stepTime: 0.1, to: 1);
    runlina3 = spriteSheetmb3.createAnimation(row: 0, stepTime: 0.1, to: 5);
    leen
      ..animation = runlina2
      ..size = Vector2(140, 150)
      ..position = Vector2(200, 20);

    add(leen);
    camera.followComponent(leen,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));

    // dadS = await loadSprite('hood.png');
    // intro = new Intro(size: size);
    // add(intro);
    _enemyManager = EnemyManager();
    add(_enemyManager);

    final button = ButtonComponent(
      button: CircleComponent(
        radius: 40,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      anchor: Anchor.bottomRight,
      position: Vector2(size.x - 800, size.y - 30),
      onPressed: leen.joystickAction,
    );
    button.positionType = PositionType.viewport;
    add(button);

    func() => {leen.animation = runlina3};

    final button1 = ButtonComponent(
      button: CircleComponent(
        radius: 40,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      anchor: Anchor.bottomRight,
      position: Vector2(size.x - 1100, size.y - 30),
      onPressed: func,
    );
    button.positionType = PositionType.viewport;
    add(button1);

    playerScore = TextComponent(
      text: 'Score: 0',
      position: Vector2(5, 5),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontFamily: 'BungeeInline',
        ),
      ),
    );
    playerScore.positionType = PositionType.viewport;

    add(playerScore);

    // Create text component for player health.
    PlayerHealth = TextComponent(
      text: 'Health: 100%',
      position: Vector2(size.x - 0, 1),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Color.fromARGB(255, 245, 245, 245),
          fontSize: 32,
          fontFamily: 'BungeeInline',
        ),
      ),
    );
    PlayerHealth.anchor = Anchor.topRight;
    PlayerHealth.positionType = PositionType.viewport;
    add(PlayerHealth);
  }

  @override
  void update(double dt) {
    super.update(dt);

    for (var command in _commandList) {
      for (var component in children) {
        command.run(component);
      }
    }

    // Remove all the commands that are processed and
    // add all new commands to be processed in next update.
    _commandList.clear();
    _commandList.addAll(_addLaterCommandList);
    _addLaterCommandList.clear();

    if (!leen.onGround) {
      velocity.y += gravity1;
    }
    leen.position += velocity * dt;

    playerScore.text = 'Score: ${leen.score}';
    PlayerHealth.text = 'Health: ${leen.health} ';

    // if (_player.health <= 0) {
    //   this.pauseEngine();
    //   this.overlays.remove(PauseButton.ID);
    //   this.overlays.add(GameOverMenu.ID);
    // }
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    super.onTapDown(pointerId, info);

    // if (!introFinished) {
    //   introFinished = true;
    //   remove(intro);
    // }

    if (leen.onGround) {
      if (info.eventPosition.viewport.x < 100) {
        print('move left');
        if (leen.facingRight) {
          leen.flipHorizontallyAroundCenter();
          leen.facingRight = false;
        }
        if (!leen.hitLeft) {
          leen.x -= 5;
          velocity.x -= pushSpeed;
          leen.animation = runlina;
        }
      } else if (info.eventPosition.viewport.x > size[0] - 100) {
        print('right');
        if (!leen.facingRight) {
          leen.flipHorizontallyAroundCenter();
          leen.facingRight = true;
        }
        if (!leen.hitRight) {
          leen.x += 5;
          velocity.x += pushSpeed;
          leen.animation = runlina;
        }
      }
      if (info.eventPosition.game.y < 100) {
        print('jump');
        leen.y -= 40;
        velocity.y = -jumpForce;
      }
    }
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (leen.health > 0) {
          pauseEngine();
          overlays.remove(PauseButton.ID);
          overlays.add(PauseMenu.ID);
        }
        break;
    }

    super.lifecycleStateChange(state);
  }

  void addCommand(Command command) {
    _addLaterCommandList.add(command);
  }

  void reset() async {
    // First reset player, enemy manager and power-up manager .
    leen.reset();
    gemGroup = homeMap.tileMap.getLayer<ObjectGroup>('gems');
    for (final gem in gemGroup!.objects) {
      add(Gem(tiledObject: gem)
        ..sprite = await loadSprite('gems/star.png')
        ..position = Vector2(gem.x, gem.y - gem.height)
        ..size = Vector2(gem.width, gem.height));
    }

    // Now remove all the enemies, bullets and power ups
    // from the game world. Note that, we are not calling
    // Enemy.destroy() because it will unnecessarily
    // run explosion effect and increase players score.
    // children.whereType<Enemy>().forEach((enemy) {
    //   enemy.removeFromParent();
    // });

    // children.whereType<Bullet>().forEach((bullet) {
    //   bullet.removeFromParent();
    // });
  }
}
