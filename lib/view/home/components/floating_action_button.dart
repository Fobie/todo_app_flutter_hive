import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/view/tasks/task_view_screen.dart';

class FloatingActionButtonItemView extends StatelessWidget {
  const FloatingActionButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => TaskViewScreen(titleTaskController: null, descriptionTaskController: null, task: null,));
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Icon(Icons.add, color: kWhiteColor,),

          ),
        ),
      ),
    );
  }
}