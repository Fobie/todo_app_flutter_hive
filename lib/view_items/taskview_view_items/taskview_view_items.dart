import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/pages/task_view_screen.dart';

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

class TaskTitleItemView extends StatelessWidget {
  const TaskTitleItemView({
    super.key,
    required this.controller,
    this.isForDescriptions = false
  });

  final TextEditingController controller;
  final bool isForDescriptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: isForDescriptions ? 5 : 1 ,
          cursorHeight: 30,
          style: TextStyle(
              color: kBlackColor
          ),
          onFieldSubmitted: (value){},
          onChanged: (value){},
          decoration: InputDecoration(
              hintText: isForDescriptions ? kAddNoteText : "Enter Your Task",
              prefixIcon: isForDescriptions ? null : Icon(Icons.task)
          ),
        ),
      ),
    );
  }
}
