import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:soundclash/application/youtube_list_controller.dart';
import 'package:soundclash/presentation/widget/sound_button.dart';

class HomePageScreen extends GetView<YoutubeListController> {
  YoutubeListController controller = Get.put(YoutubeListController());
  String userName = 'null';
  String url = 'null';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('youTube Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username'),
              onChanged: (text) {
                controller.changeUserName(text);
                print(controller.userName);
              },
            ),
            TextField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your youtube url'),
              onChanged: (text) {
                controller.changeUrl(text);
                print(controller.url);
              },
            ),
            GetBuilder<YoutubeListController>(
              builder: (YoutubeListController controller) {
                return Column(
                  children: controller.youtubeList
                      .map(
                        (url) => Text('${url.url}'),
                      )
                      .toList(),
                );
              },
            ),
            SoundButton(
              context: context,
              function: () {
                Navigator.pushNamed(context, '/rate');
              },
              text: 'Begin!',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.updateUrlList,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
