import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';
import 'package:soundclash/modules/rate_song/view/rate_song_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// current issues
/// create with modules.
///  add comments
///  analysis option file from provider
///  astract leaderboard map

///  want to add loading screen enums
///  create theme
///  log in screen auth
///  if cant get youtube id throw error
///  if null value on youtube check list
///  show youtube video on main screen of choice
/// info page which tells you how to score points
/// if you press 5 it tells you the name of the song
/// create users
/// create user profile model
/// animations

/// abstract widgets into generalise components that can be reused for example ..
/// login and pick youtube.. ont he same page
/// abstract textfield controller to controller
/// code style.. routine.... LINE BREAKS ALWAYS AFTER A CLOSED BRACKET
/// is this easy to read ...for someone coming in to read.
/// loops should be taken out of view for reaing purposes
/// functional programming ... can you easily add features for example , more songs or more ratings ect

List<RateSong> dummyYoutubeList = [
  RateSong(userName: 'omar', url: 'CXyT7dRPjS0', score: 0, position: 'unknown'),
  RateSong(userName: 'rach', url: 'TG6BuSjwP4o', score: 0, position: 'unknown'),
  RateSong(userName: 'mark', url: 'CXyT7dRPjS0', score: 0, position: 'unknown'),
  RateSong(userName: 'emily', url: 'TG6BuSjwP4o', score: 0, position: 'unknown')
];

class YoutubeListController extends GetxController {
  String url = '';
  String userName = '';
  List<RateSong> youtubeList = [];

  late RateSong rateSong;

  int score = 1;

  late YoutubePlayerController youtubePlayerController;

  initializeYoutubePlayer() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: youtubeList[0].url!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  void clearUrl() {
    url = '';
    update();
  }

  void clearUserName() {
    userName = '';
    update();
  }

  void updateUrl(String text) {
    url = text;
    score = 0;
  }

  changeUrl(text) {
    url = text;
    update();
  }

  autoGenerateList() {
    youtubeList = dummyYoutubeList;
    update();
  }

  begin(BuildContext context) {
    initializeYoutubePlayer();
    Navigator.pushNamed(context, RateSongScreen.id);
    update();
  }

  changeUserName(text) {
    userName = text;
    update();
  }

  changeRateScore(int value) {
    rateSong.score = value;
  }

  updateUrlList() {
    String? newUrl = YoutubePlayer.convertUrlToId(url);

    youtubeList.add(
      RateSong(userName: userName, url: newUrl, score: 0, position: 'unknown'),
    );

    update();
  }
}

