import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soundclash/presentation/widget/sound_button.dart';
import 'package:soundclash/modules/rate_song/controller/rate_song_controller.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RateSongScreen extends StatelessWidget {
  static const String id = 'rate_song_screen';
  final RateSongController controller = Get.put(RateSongController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RATE SONG'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<RateSongController>(
              builder: (RateSongController controller) {
                int songInList = controller.songInList;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        ' Please rate song ${controller.songInList + 1}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        child: YoutubePlayer(
                          controller: controller.youtubePlayerController,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blue,
                          // onReady: _youtubePlayerController.reload(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.rateButton
                          .map(
                            (rating) => ElevatedButton(
                              onPressed: () {
                                controller.changeScore(songInList, rating);
                              },
                              child: Text('$rating'),
                              style: ElevatedButton.styleFrom(
                                shape:const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.white, // <-- Splash color
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'you have given the score ${controller.score} ',
                      ),
                    ),
                    SoundButton(
                      context: context,
                      text: 'submit rating',
                      function: () {
                        controller.updateSongInList(context);

                        controller.update();
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
