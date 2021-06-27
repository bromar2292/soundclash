import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:soundclash/models/rate_song_round.dart';

class YoutubeListController extends GetxController {
  String url = '';
  String userName = '';
  List<RateSong> youtubeList = [];
  RateSong rateSong;
  int songInList = 0;
  int score = 1;

  void updateUrl(String text) {
    url = text;
    score = 0;
  }

  void updateSongInList() {
    songInList = songInList + 1;

    update();
  }

  changeUrl(text) {
    url = text;
    update();
  }

  changeUserName(text) {
    userName = text;
    update();
  }

  changeScore(int song, int value) {
    youtubeList[song].score = value;
  }

  changeRateScore(int value) {
    rateSong.score = value;
  }

  String getYoutubeVideoId(String Url) {
    RegExp regExp = new RegExp(
      r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
      caseSensitive: false,
      multiLine: false,
    );
    final match = regExp.firstMatch(Url).group(1); // <- This is the fix
    String str = match;
    return str;
  }

  updateUrlList() {
    String newUrl = getYoutubeVideoId('$url');
    print(newUrl);
    youtubeList.add(
      RateSong(userName, newUrl, 0),
    );
    print(youtubeList);

    update();
  }
}
