import 'package:flutter/material.dart';
import 'package:get/get.dart';
import  'package:untitled3/homeController/homeController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Remove Background App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends GetView<HomeController> {

 //HomeController controller=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("Slazzer Ai App"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('pick image')),
           GetBuilder<HomeController>(
               init: HomeController(),
               builder: (controller){
          return Center(child: controller.imageBefore == null
                  ? Text("plz pick image"):
                Image.file(controller.imageBefore!),
                );
              }),
              ElevatedButton(onPressed: () {
                controller.uploadImage(controller.imageBefore!);
              }, child: Text('upload image')),
              GetBuilder<HomeController>(builder: (controller) {
                return Center(child: controller.imageBefore == null
                    ? Text("plz upload image") :
                Image.memory(controller.imageAfter!)
                );
              })
                ],
          ),
        ),
      ),
    );
  }
}
