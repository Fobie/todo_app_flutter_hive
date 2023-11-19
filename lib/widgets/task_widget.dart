import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)
        ),
        duration: const Duration(milliseconds: 600),
        child: GestureDetector(
          onTap: (){

          },
          child: ListTile(
            leading: AnimatedContainer(
              duration:const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: kGreyColor, width: 0.8)
              ),
              child: Icon(Icons.check, color: kWhiteColor),
            ),
            title:const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Done',
                style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                      color: kGreyColor,
                      fontWeight: FontWeight.w300
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 14,
                              color: kGreyColor
                          ),
                        ),
                        Text(
                          'SubDate',
                          style: TextStyle(
                              fontSize: 14,
                              color: kGreyColor
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}