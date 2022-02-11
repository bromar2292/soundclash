import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:soundclash/modules/pick_song/controller/pick_youtube_song_controller.dart';
import 'package:soundclash/presentation/widget/input_info.dart';
import 'package:soundclash/presentation/widget/sound_button.dart';
import 'package:soundclash/presentation/widget/submit_circle_button.dart';

class PickYoutubeSong extends GetView<PickYoutubeSongController> {
  static const String id = 'pick_song_screen';

  final _controllerUser = TextEditingController();
  final _controllerUrl = TextEditingController();
  @override
  final PickYoutubeSongController controller = Get.put(PickYoutubeSongController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFECF3F9),
      appBar: AppBar(
        title: const Text('youTube Selector'),
      ),
      body: Stack(
        children: [
          Container(
            height: 400,
            color: Colors.orange,
          ),
          Center(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputInfo(
                    request: 'enter your username',
                    function: (text) {
                      controller.changeUserName(text);
                    },
                    icon:const Icon(Icons.person),
                    controller: _controllerUser,
                  ),
                  InputInfo(
                    request: 'enter your url',
                    function: (text) {
                      controller.changeUrl(text);
                    },
                    icon:const Icon(Icons.search),
                    controller: _controllerUrl,
                  ),
                  GetBuilder<PickYoutubeSongController>(
                    builder: (PickYoutubeSongController controller) {
                      return Column(
                        children: controller.youtubeList
                            .map(
                              (url) => Text(url.url!),
                            )
                            .toList(),
                      );
                    },
                  ),
                  SoundButton(
                    context: context,
                    function: controller.updateUrlList,
                    text: 'Add song to list ',
                  ),
                  SoundButton(
                    context: context,
                    function: controller.autoGenerateList,
                    text: 'auto generate list',
                  ),
                ],
              ),
            ),
          ),
          SubmitButton(function: () {
            controller.begin(context);
          })
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
