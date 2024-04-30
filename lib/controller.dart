
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    getColorFromShared();
    super.onInit();
  }



  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.deepOrange,
    Colors.purple,
    Colors.green,
    Colors.cyan
  ];
  Color appColor = Colors.red;


  changeColor(Color color)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    appColor = color;
    await preferences.setInt('color', color.value);
    update();
  }
  getColorFromShared()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    appColor = Color(preferences.getInt('color') ?? Colors.red.value);
    update();
  }

}