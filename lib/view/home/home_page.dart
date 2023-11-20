import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/view/home/components/floating_action_button.dart';
import 'package:todoapp/view/home/components/home_appbar.dart';
import 'package:todoapp/view/home/components/slider_drawer.dart';
import 'package:todoapp/view/home/widget/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerState> dKey = GlobalKey<SliderDrawerState>();

  dynamic valueOfIndicator(List<Task> task){
    if(task.isNotEmpty){
      return task.length;
    } else {
      return 3;
    }
  }

  int checkDoneStatus(List<Task> task){
    int i = 0;
    for(Task doneTask in task){
      if(doneTask.isCompleted){
        i++;
      }
    }
    return i;
  }

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    return ValueListenableBuilder(
        valueListenable: base.dataStore.listenToTask(),
        builder: (ctx, Box<Task> box, Widget? child){

          var tasks = box.values.toList();

          tasks.sort((a,b) => a.createdAtDate.compareTo(b.createdAtDate));

          return Scaffold(
            backgroundColor: kWhiteColor,
            body: SliderDrawer(
                key: dKey,
                isDraggable: false,
                appBar: HomeAppBar(dKey: dKey),
                slider: CustomSliderDrawer(),
                child: _buildHomeBody(
                    context,
                    base,
                    tasks
                )
            ),
            //  floating button
            floatingActionButton: FloatingActionButtonItemView(),
          );
        }
    );
  }

  Widget _buildHomeBody(
      BuildContext context,
      BaseWidget base,
      List<Task> tasks
      ) {
    return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
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
                          value: checkDoneStatus(tasks) / valueOfIndicator(tasks),
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
                          '${checkDoneStatus(tasks)} out of ${tasks.length} tasks',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    )
                  ],
                ),
              ),
              //divider
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Divider(
                  thickness: 2,
                  indent: 75,
                ),
              ),

              Expanded(
                  child:tasks.isNotEmpty ? ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index){
                        var task = tasks[index];
                        return Dismissible(
                            direction: DismissDirection.horizontal,
                            onDismissed: (_){
                              base.dataStore.daleteTask(task: task);
                            },
                            key: Key(
                                task.id
                            ),
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: kGreyColor,
                                ),
                                Text(
                                  kDeletedText,
                                  style: TextStyle(
                                      color: kGreyColor
                                  ),
                                )
                              ],
                            ),
                            child: TaskWidget(task: task,)
                        );
                      }) :  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(
                              'assets/lottie/1.json',
                            animate: tasks.isNotEmpty ? false : true
                          ),
                        ),
                      ),
                      FadeInUp(
                          child: Text(
                            kDoneAllText,
                          )
                      )
                    ],
                  )
              )
            ],
          ),
        );
  }
}






