import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/dimens.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/task.dart';
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

  var title;
  var subtitle;
  DateTime? time;
  DateTime? date;

  bool isAlreadyExistTask() {
    if (widget.titleTaskController?.text == null &&
        widget.descriptionTaskController?.text == null) {
      return true;
    } else {
      return false;
    }
  }

  String showTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('hh:mm a').format(time).toString();
      }
    } else {
      return DateFormat('hh:mm a')
          .format(widget.task!.createdAtTime)
          .toString();
    }
  }

  String showDate(DateTime? date) {
    if (widget.task?.createdAtDate == null) {
      if (date == null) {
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      } else {
        return DateFormat.yMMMEd().format(date).toString();
      }
    } else {
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    }
  }

  DateTime showTimeAsDateTime(DateTime? time) {
    if (widget.task?.createdAtTime == null) {
      if (time == null) {
        return DateTime.now();
      } else {
        return time;
      }
    } else {
      return widget.task!.createdAtTime;
    }
  }

  dynamic isAlreadyExistUpdateOrCreateTask() {
    if(widget.titleTaskController?.text != null && widget.descriptionTaskController?.text != null){
      try{
        widget.titleTaskController?.text = title;
        widget.descriptionTaskController?.text = subtitle;

        widget.task?.save();
        Get.back();
      } catch (e){
        nothingEnterOnUpdateTaskMode(context);
      }
    } else {
        if(title != null && subtitle != null){
          var task = Task.create(
              title: title,
              subtitle: subtitle,
              createdAtDate: date,
              createdAtTime: time
          );
          
          BaseWidget.of(context).dataStore.addTask(task: task);
          Get.back();
        } else {
          emptyFieldsWarning(context);
        }
    }
  }

  dynamic deleteTask(){
    return widget.task?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: TaskViewAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopSideText(context),
              _buildMainTaskViewActivity(context),
              SizedBox(
                height: 25,
              ),
              _buildBottomButtons()
            ],
          ),
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
                  isAlreadyExistTask() ? kAddNewText : kUpdateTaskText,
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
                        controller: widget  .titleTaskController,
                      onChanged: (String inputTitle) {
                          title = inputTitle;
                      },
                      onFieldSubmiited: (String inputTitle) {
                        title = inputTitle;
                      },
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    RepTextField(
                        controller: widget.descriptionTaskController,
                      isForDescriptions : true,
                      onChanged: (String inputSubtitle) {
                          subtitle = inputSubtitle;
                      },
                      onFieldSubmiited: (String inputSubtitle) {
                        subtitle = inputSubtitle;
                      },
                    ),

                    TimePickerField(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SizedBox(
                                height: 280,
                                child: TimePickerWidget(
                                  onChange: (_,__){},
                                  initDateTime: showTimeAsDateTime(time),
                                  dateFormat: 'HH:mm',
                                  onConfirm: (dateTime,_){
                                    setState(() {
                                      if(widget.task?.createdAtTime == null){
                                        time = dateTime;
                                      } else {
                                        widget.task!.createdAtTime = dateTime;
                                      }
                                    });
                                  },
                                ),
                              )
                          );
                        },
                        title: kTimeText, time: showTime(time),
                    ),
                    TimePickerField(
                        onTap: (){
                          DatePicker.showDatePicker(
                              context,
                              minDateTime: DateTime.now(),
                              initialDateTime: showTimeAsDateTime(date),
                              onConfirm: (dateTime,_){
                                setState(() {
                                  if(widget.task?.createdAtDate == null){
                                    date = dateTime;
                                  } else {
                                    widget.task!.createdAtDate = dateTime;
                                  }
                                });
                              }
                          );
                        },
                        title: kDateText, time: showDate(date),
                    ),
                  ],
                )
            );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: isAlreadyExistTask() ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
      children: [
        isAlreadyExistTask() ? Container() :
        MaterialButton(
          onPressed: (){
            deleteTask();
            Get.back();
          },
          minWidth: 150,
          height: 50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          color: kWhiteColor,
          child: Row(
            children: [
              Icon(Icons.close,
                color: kPrimaryColor
                ,),
              SizedBox(
                width: 5,
              ),
              Text(
                kDeleteText,
                style: TextStyle(
                    color: kPrimaryColor
                ),

              ),
            ],
          ),
        ),
        MaterialButton(
          onPressed: (){
            isAlreadyExistUpdateOrCreateTask();
          },
          minWidth: 150,
          height: 50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          color: kPrimaryColor,
          child: Row(
            children: [
              Icon(
                isAlreadyExistTask() ? Icons.add : Icons.update,
                // Icons.update,
                color: kWhiteColor
                ,),
              SizedBox(
                width: 5,
              ),
              Text(
                isAlreadyExistTask() ? kAddNewText : kUpdateTaskText,
                // kUpdateTaskText,
                style: TextStyle(
                    color: kWhiteColor
                ),

              ),
            ],
          ),
        ),

      ],
    );
  }
}














