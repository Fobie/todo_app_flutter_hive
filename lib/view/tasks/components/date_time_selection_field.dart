import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';

class TimePickerField extends StatelessWidget {
  const TimePickerField({
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