import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/view_items/taskview_view_items/taskview_view_items.dart';
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
                SizedBox(
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

                        Container(
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
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




