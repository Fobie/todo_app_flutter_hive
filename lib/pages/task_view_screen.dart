import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/view_items/taskview_view_items/taskview_view_items.dart';
import 'package:todoapp/widgets/button_widget.dart';
import 'package:todoapp/widgets/taskview_title_widget.dart';

class TaskViewScreen extends StatefulWidget {
  const TaskViewScreen({super.key});

  @override
  State<TaskViewScreen> createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TaskViewTitleWidget(),
                AddNewTaskBodyItemView(titleTaskController: titleTaskController, descriptionTaskController: descriptionTaskController),
                SizedBox(
                  height: 25,
                ),
                AddNewTaskButtonItemView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}












