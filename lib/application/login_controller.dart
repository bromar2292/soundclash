import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:soundclash/modules/pick_song/view/pick_youtube_song.dart';

class LoginController extends GetxController {
  bool login = false;

  switchToLogin() {
    login = false;
    update();
  }

  switchToSignUp() {
    login = true;
    update();
  }

  submit(BuildContext context) {
    return Navigator.pushNamed(context, PickYoutubeSong.id);
  }
}
