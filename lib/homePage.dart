import 'package:changecolor/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: controller.appColor,
            title: const Text('تغيير لون التطبيق',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
            ),),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              width: Get.width,
              height: 40,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.colors.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: ()async{
                        await controller.changeColor(controller.colors[index]);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controller.colors[index],
                          border: Border.all(color: Colors.black54,width: controller.colors[index].value == controller.appColor.value ? 0 : 4)
                        ),
                        child: Center(
                          child: controller.colors[index].value == controller.appColor.value ?
                          const Icon(Icons.check,color: Colors.white,) : const SizedBox(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
