import 'package:flutter/material.dart';
import 'package:flutter_practice/controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller controller = Get.put(Controller());

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('GetX'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<Controller>(
                  init: Controller(),
                  builder: (_) =>
                      Text('Current value is: ${Get.find<Controller>().x}',
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                ),
                ElevatedButton(onPressed: () {
                  Get.find<Controller>().increment();
                }, child: Text('Add number'))
              ],
            ),
          ),
        ));
  }
}
