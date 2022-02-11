import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soundclash/presentation/widget/sound_button.dart';

import 'package:soundclash/modules/leaderboard/presentation/controller/leaderboard_controller.dart';


class LeaderBoardScreen extends GetView<LeaderboardController> {
  static const String id = 'leaderboard_screen';
  @override
  final LeaderboardController controller = Get.put(LeaderboardController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('leaderboard'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                color: Colors.lightGreen,
              ),
              Column(
                children: [
                  Text(
                    controller.winningPlayer.position!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70'),
                      radius: 80,
                    ),
                  ),
                  // TODO: turn into widget
                  Text(
                    controller.winningPlayer.userName!,
                    style: primaryStyle(),
                  ),
                  Text(
                    '${controller.winningPlayer.score}',
                    style: primaryStyle(),
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GetBuilder<LeaderboardController>(
                  builder: (LeaderboardController controller) {
                    return Column(
                      children: controller.sortedYoutubeList!
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration:const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  color: Color(
                                    0xFFEDF0F1,
                                  ),
                                ),
                                padding:const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        item.position!,
                                        style: secondaryStyle(),
                                      ),
                                    ),
                                const    Padding(
                                      padding:  EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70'),
                                        radius: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        item.userName!,
                                        style: secondaryStyle(),
                                      ),
                                    ),
                                   const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        '${item.score}',
                                        style: secondaryStyle(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                SoundButton(
                  function: () {
                    // print(controller.youtubeList
                    //     .sort((a, b) => a.score.compareTo(b.score)));
                  },
                  text: 'finish',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle secondaryStyle() {
    return const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }

  TextStyle primaryStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );
  }
}
