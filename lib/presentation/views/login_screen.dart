import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:soundclash/application/login_controller.dart';
import 'package:soundclash/presentation/widget/input_info.dart';
import 'package:soundclash/presentation/widget/submit_circle_button.dart';

class LoginScreen extends GetView<LoginController> {
  static const String id = 'login_screen';

  final _controllerUser = TextEditingController();
  final _controllerUrl = TextEditingController();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFECF3F9),
      appBar: AppBar(
        title: const Text('Welcome to Soundclash'),
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
                    spreadRadius: 5,
                  )
                ],
              ),
              child: GetBuilder<LoginController>(
                builder: (LoginController controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child:const Text('login'),
                            onPressed: () {
                              controller.switchToLogin();
                            },
                          ),
                          TextButton(
                            child:const Text('sign up '),
                            onPressed: () {
                              controller.switchToSignUp();
                            },
                          ),
                        ],
                      ),
                      Visibility(
                        visible: controller.login,
                        child: InputInfo(
                          request: 'enter your username',
                          function: (text) {
                            print(text);
                          },
                          icon:const Icon(Icons.person),
                          controller: _controllerUser,
                        ),
                      ),
                      InputInfo(
                        request: 'enter your email',
                        function: (text) {
                          print(text);
                        },
                        icon: Icon(Icons.search),
                        controller: _controllerUrl,
                      ),
                      InputInfo(
                        request: 'enter your password',
                        function: (text) {
                          print(text);
                        },
                        icon: Icon(Icons.search),
                        controller: _controllerUrl,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SubmitButton(
            function: () => controller.submit(context),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
