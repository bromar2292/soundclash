import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';

class YoutubeList {
  List<RateSong>? youtubeList;

  void addToList(RateSong song) {
    youtubeList?.add(song);
  }

  void getSongs() => youtubeList;
}
