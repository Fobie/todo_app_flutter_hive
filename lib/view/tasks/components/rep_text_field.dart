import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDescriptions = false,
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