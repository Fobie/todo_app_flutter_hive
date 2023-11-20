import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/models/task.dart';
import 'package:get/get.dart';
import 'package:todoapp/view/tasks/task_view_screen.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.task});

  final Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  TextEditingController textEditingControllerForTitle = TextEditingController();
  TextEditingController textEditingControllerForSubtitle = TextEditingController();

  @override
  void initState() {
    textEditingControllerForTitle.text = widget.task.title;
    textEditingControllerForSubtitle.text = widget.task.subtitle;
    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerForTitle.dispose();
    textEditingControllerForSubtitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(TaskViewScreen(
            titleTaskController: textEditingControllerForTitle,
            descriptionTaskController: textEditingControllerForSubtitle,
            task: widget.task)
        );
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: widget.task.isCompleted ? kPrimaryColor.withOpacity(0.3): kWhiteColor,
            borderRadius: BorderRadius.circular(15),
            border: widget.task.isCompleted ? null : Border.all()
        ),
        duration: const Duration(milliseconds: 600),
        child: ListTile(
          leading: GestureDetector(
            onTap: (){
              widget.task.isCompleted = !widget.task.isCompleted;
              widget.task.save();
            },
            child: AnimatedContainer(
              duration:const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                  color: widget.task.isCompleted ? kPrimaryColor : kWhiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: kGreyColor, width: 0.8)
              ),
              child: Icon(Icons.check, color: kWhiteColor),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
            textEditingControllerForTitle.text,
            style: TextStyle(
            color: widget.task.isCompleted ? kPrimaryColor : kBlackColor,
            fontWeight: FontWeight.w500,
            decoration: widget.task.isCompleted ? TextDecoration.lineThrough : null
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textEditingControllerForSubtitle.text,
              style: TextStyle(
                  color: widget.task.isCompleted ? kPrimaryColor : kBlackColor,
                  fontWeight: FontWeight.w300,
                  decoration: widget.task.isCompleted ? TextDecoration.lineThrough : null
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      DateFormat("hh:mm a").format(widget.task.createdAtTime),
                      style: TextStyle(
                          fontSize: 12,
                          color: widget.task.isCompleted ? kBlackColor : kGreyColor
                      ),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(widget.task.createdAtDate),
                      style: TextStyle(
                          fontSize: 12,
                          color: widget.task.isCompleted ? kBlackColor : kGreyColor
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        ),
    )
    );
  }
}
