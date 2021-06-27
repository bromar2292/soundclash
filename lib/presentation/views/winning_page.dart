import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:soundclash/application/youtube_list_controller.dart';

class WinningScreen extends GetView<YoutubeListController> {
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
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// TODO: create nice table that shows data
                /// with circle avatar
                /// other thing to do ... sort youtube que
                /// move song list index to controller
                GetBuilder<YoutubeListController>(
                  builder: (YoutubeListController controller) {
                    controller.youtubeList
                        .sort((a, b) => b.score.compareTo(a.score));

                    return Column(
                      children: controller.youtubeList
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  color: Color(0xFFEDF0F1),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        '1st place',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
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
                                        item.userName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 22),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        '${item.score}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
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

                ElevatedButton(
                  onPressed: () {
                    // print(controller.youtubeList
                    //     .sort((a, b) => a.score.compareTo(b.score)));
                  },
                  child: const Text('finish'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
