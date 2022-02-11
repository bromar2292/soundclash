import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soundclash/application/youtube_list_controller.dart';
import 'package:soundclash/models/Youtube_list.dart';
import 'package:soundclash/modules/leaderboard/presentation/view/leaderboard_screen.dart';
import 'package:soundclash/modules/pick_song/controller/pick_youtube_song_controller.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';
import 'package:soundclash/modules/rate_song/use_cases/change_score.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RateSongController extends GetxController {
  final List<int> rateButton = [
    1,
    2,
    3,
    4,
    5,
  ];

  int songInList = 0;
  int score = 1;

  List<RateSong>? youtubeList = [];

  late YoutubePlayerController youtubePlayerController;
  final songInListPlusOne = ChangeScore();
  @override
  void onInit() {
    initalise();
    YoutubeList youtube = YoutubeList();
    youtube.addToList(RateSong(url: ' added at ratesong'));
    print(youtube.youtubeList);
    super.onInit();
  }

  void initalise() {
    Get.put(PickYoutubeSongController());
    PickYoutubeSongController instance = Get.find();

    if (youtubeList!.isEmpty) {
      youtubeList = instance.youtubeList;
      youtubePlayerController = instance.youtubePlayerController;
    }

    Get.delete<YoutubeListController>();
  }

  updateSongInList(
    BuildContext context,
  ) {
    songInList = songInListPlusOne(songInList);

    if (songInList == youtubeList!.length) {
      songInList = 0;

      return Navigator.pushNamed(context, LeaderBoardScreen.id);
    }

    youtubePlayerController.load(youtubeList![songInList].url!);
    update();
  }

  changeScore(int song, int value) {
    youtubeList![song].score = value;
    score = value;
    update();
  }
}
