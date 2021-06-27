import 'package:flutter/material.dart';
import 'package:soundclash/presentation/views/my_home_page.dart';
import 'package:soundclash/presentation/views/rate_song.dart';
import 'package:soundclash/presentation/views/winning_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePageScreen(),
      routes: {
        '/rate': (context) => RateScreen(),
        '/winner': (context) => WinningScreen(),
      },
    ),
  );
}
