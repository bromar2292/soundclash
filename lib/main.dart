import 'package:flutter/material.dart';
import 'package:soundclash/modules/leaderboard/presentation/view/leaderboard_screen.dart';
import 'package:soundclash/modules/pick_song/view/pick_youtube_song.dart';
import 'package:soundclash/modules/rate_song/view/rate_song_screen.dart';
import 'package:soundclash/presentation/views/login_screen.dart';
void main() {
  runApp(
    MaterialApp(
      home: LoginScreen(),
      routes: {
        PickYoutubeSong.id: (context) => PickYoutubeSong(),
        RateSongScreen.id: (context) => RateSongScreen(),
        LeaderBoardScreen.id: (context) => LeaderBoardScreen(),
      },
    ),
  );
}

///TODO: change everything to clean arcitecture.
/// create log in
/// plan out firebase data base
/// hide youtube videos
/// show youtube videos if you click 3
/// have a bandcamp only version?
/// how do you join a game ?

/// later on
/// challenge someone to sound clash
