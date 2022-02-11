import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:soundclash/models/Youtube_list.dart';
import 'package:soundclash/modules/leaderboard/use_cases/get_winner.dart';
import 'package:soundclash/modules/leaderboard/use_cases/sort_youtube_list.dart';
import 'package:soundclash/modules/rate_song/controller/rate_song_controller.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';

class LeaderboardController extends GetxController {
  late RateSong winner;

  List<RateSong>? youtubeList = [];

  List<String> positions = ['1st', '2nd', '3rd', '4th'];

  @override
  void onInit() {
    initalise();
    YoutubeList youtube = YoutubeList();
    youtube.addToList(RateSong(url: ' added at leaderboard'));
    print(youtube.youtubeList);
    super.onInit();
  }

  /// gets youtube list from youtube list controller
  void initalise() {
    Get.put(RateSongController());
    RateSongController instance = Get.find();

    final getWinner = GetWinner();
    final sortYoutubeList = SortYouTubeList();

    if (youtubeList!.isEmpty) {
      youtubeList = instance.youtubeList!;

      youtubeList = sortYoutubeList(instance.youtubeList!, positions);
      print(youtubeList);
      winner = getWinner(youtubeList!);
    }
    Get.delete<RateSongController>();
  }

  List<RateSong>? get sortedYoutubeList {
    return youtubeList;
  }

  RateSong get winningPlayer {
    return winner;
  }
}
