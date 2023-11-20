import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/view/tasks/widget/button_widget.dart';

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