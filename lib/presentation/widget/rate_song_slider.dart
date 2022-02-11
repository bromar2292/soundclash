import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundclash/modules/rate_song/models/rate_song_round.dart';


class RateSongSlider extends StatefulWidget {
  final RateSong? rateSong;
  const RateSongSlider(RateSong youtubeList, {this.rateSong});
  @override
  _RateSongSliderState createState() => _RateSongSliderState();
}

class _RateSongSliderState extends State<RateSongSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: widget.rateSong!.score!.toDouble(),
        min: 0,
        max: 100,
        divisions: 10,
        label: widget.rateSong!.score.toString(),
        onChanged: (double value) {
          setState(
            () {
              widget.rateSong!.score = value.toInt();
              print(widget.rateSong!.score);
            },
          );
        },
      ),
    );
  }
}
