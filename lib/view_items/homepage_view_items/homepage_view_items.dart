import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';

class FloatingActionButtonItemView extends StatelessWidget {
  const FloatingActionButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('gettet');
      },
      child: Material(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Icon(Icons.add, color: kWhiteColor,),

          ),
        ),
      ),
    );
  }
}

class TasksInfoItemView extends StatelessWidget {
  const TasksInfoItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                value: 1 / 3,
                backgroundColor: kGreyColor,
                valueColor: AlwaysStoppedAnimation(
                    kPrimaryColor
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kMyTasksText,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '1 out of 3 tasks',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}