import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/homeController/homeController.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
      backgroundColor: Color(0xffD9D9D9) ,
      appBar: AppBar(
        backgroundColor: Color(0xff4F7E9E),
        title: Text("Slazzer Ai App",
        style: TextStyle(color: Color(0xffD9D9D9))
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                controller.getImage();
                 },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4F7E9E),
                  ),
                  child: Text('pick image',
                  style: TextStyle(color: Color(0xffD9D9D9))
              )),
           GetBuilder<HomeController>(
               init: HomeController(),
               builder: (controller){
          return Center(child: controller.imageBefore == null
                  ? Text("please pick image",
              style: TextStyle(color: Color(0xff4F7E9E))
          ):
                Image.file(controller.imageBefore!),
                );
              }),
              SizedBox(height: 12),
              ElevatedButton(onPressed: () {
                controller.uploadImage(controller.imageBefore!);
              },   style: ElevatedButton.styleFrom(
                primary: Color(0xff4F7E9E),
              ),
                  child: Text('upload image',
                  style: TextStyle(color: Color(0xffD9D9D9))
              )),
              GetBuilder<HomeController>(builder: (controller) {
                return Center(child: controller.imageBefore == null
                    ? Text("please upload image",
                    style: TextStyle(color: Color(0xff4F7E9E))
                ) :
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
