import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';

class SortYouTubeList {
  /// this sorts youtube list and positions
  List<RateSong> call(List<RateSong> youtubeList, List<String> positions) {
    youtubeList.sort((a, b) => b.score!.compareTo(a.score!));

    for (var i = 0; i <= positions.length - 1; i++) {
      if (i == youtubeList.length) {
        return youtubeList;
      }
      youtubeList[i].position = positions[i];
    }
    return youtubeList;
  }
}
