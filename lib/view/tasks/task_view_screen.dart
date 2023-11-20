import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/view/tasks/components/bottom_buttons.dart';
import 'package:todoapp/view/tasks/components/date_time_selection_field.dart';
import 'package:todoapp/view/tasks/components/rep_text_field.dart';

import 'widget/task_view_app_bar.dart';

class TaskViewScreen extends StatefulWidget {
 const TaskViewScreen({super.key,
    required this.titleTaskController,
    required this.descriptionTaskController,
    required this.task,});

  final TextEditingController? titleTaskController;
  final TextEditingController? descriptionTaskController;

  final Task? task;

  @override
  State<TaskViewScreen> createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: TaskViewAppBar(),
        body: Column(
          children: [
            _buildTopSideText(context),
            _buildMainTaskViewActivity(context),
            SizedBox(
              height: 25,
            ),
            AddNewTaskButtonItemView()
          ],
        )
      ),
    );
  }

  Widget _buildTopSideText(BuildContext context)  {
    return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
            SizedBox(
            width: double.infinity,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 55,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Text(
                  kAddNewText,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 30),
                ),
                SizedBox(
                  width: 55,
                  child: Divider(
                    thickness: 2,
                  ),
                )
              ],
            ),
          ),
            ],
          ),
        ),
      );
  }

  Widget _buildMainTaskViewActivity(BuildContext context) {
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
                    RepTextField(
                        controller: widget.titleTaskController
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    RepTextField(
                        controller: ,
                      isForDescriptions : true,
                    ),

                    TimePickerField(
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
                    TimePickerField(
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














