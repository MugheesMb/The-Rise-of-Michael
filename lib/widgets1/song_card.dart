import 'package:flutter/material.dart';
import 'package:game2/screens1/song_screen.dart';
import 'package:game2/widgets1/seekbar.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../models1/song_model.dart';
import '../screens1/MiniPlayerScreeView.dart';
import 'player_buttons.dart';

class SongCard extends StatelessWidget {
  SongCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  Song song = Get.arguments ?? Song.songs[0];
  AudioPlayer audioPlayer = AudioPlayer();
  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(
                    song.coverUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Get.toNamed('/song', arguments: song);
            },
          ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.black.withOpacity(0.8),
            ),
            child: const MiniPlayerView(),
          ),
        ],
      ),
    );
  }
}
