import 'package:flutter/material.dart';
import 'package:todoapp/const/strings.dart';

class TaskViewTitleWidget extends StatelessWidget {
  const TaskViewTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            width: 55,
            child: Divider(
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }
}