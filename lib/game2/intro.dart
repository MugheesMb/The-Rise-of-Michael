import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game2/game2/Home.dart';

class Intro extends PositionComponent with HasGameRef<Leena> {
  Intro({required size}) : super(size: size);

  late SpriteComponent dad;
  String introString =
      'Michael, We have kidnapped your Wife, if you want your wife back then give us Golden Coins.'
      'otherwise we will kill her. So brought us those Golden Coins as soon as possible. your time starts Now';

  @override
  void render(Canvas canvas) {
    canvas.drawColor(Colors.blueGrey, BlendMode.src);
  }

  @override
  Future<void>? onLoad() async {
    dad = SpriteComponent()
      ..sprite = gameRef.dadS
      ..size = Vector2(size.y, size.y)
      ..position = Vector2(size.x / 2, 50);
    add(dad);
    add(IntroBox(introString, size.x / 2)..position = Vector2(100, 200));
    return super.onLoad();
  }
}

class IntroBox extends TextBoxComponent {
  IntroBox(String text, double width)
      : super(
          text: text,
          textRenderer: TextPaint(
              style: const TextStyle(fontSize: 32.0, color: Colors.black87)),
          boxConfig: TextBoxConfig(timePerChar: 0.05, maxWidth: width),
        );

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = Colors.white24);
  }
}
