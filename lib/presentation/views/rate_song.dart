import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:soundclash/application/youtube_list_controller.dart';
import 'package:soundclash/presentation/widget/sound_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RateScreen extends StatelessWidget {
  List<int> rateButton = [1, 2, 3, 4, 5];
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
            GetBuilder<YoutubeListController>(
              builder: (YoutubeListController controller) {
                int songInList = controller.songInList;
                YoutubePlayerController _youtubePlayerController =
                    YoutubePlayerController(
                  initialVideoId: controller.youtubeList[songInList].url,
                  flags: YoutubePlayerFlags(autoPlay: false),
                );

                return Column(
                  children: [
                    Container(
                      child: YoutubePlayer(
                        controller: _youtubePlayerController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blue,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rateButton
                          .map(
                            (button) => ElevatedButton(
                              onPressed: () {
                                controller.changeScore(songInList, button);
                                controller.update();
                              },
                              child: Text('$button'),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.white, // <-- Splash color
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SoundButton(
                      context: context,
                      text: 'submit rating',
                      function: () {
                        controller.updateSongInList();

                        if (controller.songInList ==
                            controller.youtubeList.length) {
                          controller.songInList = 0;
                          Navigator.pushNamed(context, '/winner');
                        } else {
                          _youtubePlayerController
                              .load(controller.youtubeList[songInList + 1].url);
                          _youtubePlayerController.reload();
                        }
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
