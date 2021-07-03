import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:random_generator/app/modules/home/local_widgets/number_picker.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  final from = 0.obs;
  final to = 0.obs;
  final rnd = 0.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Column(
                    children: [Text("From"),
                      NumberPicker(
                        onValueChanged: (v) {
                          from.value = v;
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [Text("To"),
                      NumberPicker(
                        onValueChanged: (v) {
                          to.value = v;
                        },
                      ),
                    ],
                  ),
                ]),
              ),
              Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(Size(190, 100)),
                        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 23)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      rnd.value = controller.generate(from.value, to.value);
                    },
                    child: Text("Generate" )),
              ),
              Obx(() => Text(rnd.toString(),style: TextStyle(fontSize: 42,fontWeight: FontWeight.w300)))
            ],
          ),
        )),
      ),
    );
  }
}
