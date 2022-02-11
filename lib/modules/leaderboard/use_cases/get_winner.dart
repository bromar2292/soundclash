import 'package:soundclash/modules/leaderboard/errors/leaderboard_exeption.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';

class GetWinner {
  RateSong call(List<RateSong> youtubeList) {
    if (youtubeList.isEmpty) {
      LeaderboardExeption('sorted youtube list is empty');
    }
    RateSong winner = youtubeList.removeAt(0);

    return winner;
  }
}
