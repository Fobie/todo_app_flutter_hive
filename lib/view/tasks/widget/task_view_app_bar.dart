import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(Icons.arrow_back_ios_rounded),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);

}