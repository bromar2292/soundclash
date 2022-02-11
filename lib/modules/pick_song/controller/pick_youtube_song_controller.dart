import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:soundclash/application/youtube_list_controller.dart';
import 'package:soundclash/models/Youtube_list.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';
import 'package:soundclash/modules/rate_song/view/rate_song_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

List<RateSong> dummyYoutubeList = [
  RateSong(userName: 'omar', url: 'CXyT7dRPjS0', score: 0, position: 'unknown'),
  RateSong(userName: 'rach', url: 'TG6BuSjwP4o', score: 0, position: 'unknown'),
  RateSong(userName: 'mark', url: 'CXyT7dRPjS0', score: 0, position: 'unknown'),
  RateSong(userName: 'emily', url: 'TG6BuSjwP4o', score: 0, position: 'unknown')
];

class PickYoutubeSongController extends GetxController {
  String url = '';
  String userName = '';
  List<RateSong> youtubeList = [];

   late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    initalise();
    YoutubeList youtube = YoutubeList();
    youtube.addToList(RateSong(
        url: ' added at pick youtube'
            ''));
    print(youtube.youtubeList);

    super.onInit();
  }

  void initalise() {
    Get.put(YoutubeListController());
    YoutubeListController controller = Get.find();
    if (youtubeList.isEmpty) {
      youtubeList = controller.youtubeList;
    }
    Get.delete<YoutubeListController>();
  }

  void clearUrl() {
    url = '';
    update();
  }

  void clearUserName() {
    userName = '';
    update();
  }

  initializeYoutubePlayer() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: youtubeList[0].url!,
      flags:const YoutubePlayerFlags(autoPlay: true),
    );
  }

  changeUserName(text) {
    userName = text;
    update();
  }

  changeUrl(text) {
    url = text;
    update();
  }

  autoGenerateList() {
    youtubeList = dummyYoutubeList;
    update();
  }

  updateUrlList() {
    String? newUrl = YoutubePlayer.convertUrlToId(url);

    youtubeList.add(
      RateSong(userName: userName, url: newUrl, score: 0, position: 'unknown'),
    );

    update();
  }

  begin(BuildContext context) {
    initializeYoutubePlayer();
    Navigator.pushNamed(context, RateSongScreen.id);
    update();
  }
}
