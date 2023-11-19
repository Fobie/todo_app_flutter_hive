import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:get/get.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/pages/task_view_screen.dart';
import 'package:todoapp/widgets/button_widget.dart';

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

class TimePickerItemView extends StatelessWidget {
  const TimePickerItemView({
    super.key,
    required this.onTap,
    required this.title
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: kWhiteColor,
            border: Border.all(
                color: kGreyColor
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200
                ),
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddNewTaskBodyItemView extends StatelessWidget {
  const AddNewTaskBodyItemView({
    super.key,
    required this.titleTaskController,
    required this.descriptionTaskController,
  });

  final TextEditingController titleTaskController;
  final TextEditingController descriptionTaskController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                kPlanningText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TaskTitleItemView(
              controller: titleTaskController,
            ),

            SizedBox(
              height: 15,
            ),

            TaskTitleItemView(
              controller: descriptionTaskController,
              isForDescriptions: true,
            ),

            TimePickerItemView(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (_) => SizedBox(
                        height: 280,
                        child: TimePickerWidget(
                          onChange: (_,__){},
                          dateFormat: 'HH:mm',
                          onConfirm: (dateTime,_){},
                        ),
                      )
                  );
                },
                title: kTimeText
            ),
            TimePickerItemView(
                onTap: (){
                  DatePicker.showDatePicker(
                      context,
                      minDateTime: DateTime.now(),
                      onConfirm: (dateTime,_){

                      }
                  );
                },
                title: kDateText
            ),
          ],
        )
    );
  }
}

class AddNewTaskButtonItemView extends StatelessWidget {
  const AddNewTaskButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWidget(
          icon: Icons.close,
          text: kDeleteText,
          color: kWhiteColor,
          textColor: kPrimaryColor,
        ),
        ButtonWidget(
          icon: Icons.add,
          text: kAddTaskText,
          color: kPrimaryColor,
          textColor: kWhiteColor,
        ),

      ],
    );
  }
}