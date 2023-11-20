import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
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
  final List<int> testing = [1,2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SliderDrawer(
        key: dKey,
        isDraggable: false,
          appBar: HomeAppBar(dKey: dKey),
          slider: CustomSliderDrawer(),
          child: _buildHomeBody(context)
      ),
    //  floating button
      floatingActionButton: FloatingActionButtonItemView(),
    );
  }

  Widget _buildHomeBody(BuildContext context) {
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
                  child:testing.isNotEmpty ? ListView.builder(
                      itemCount: testing.length,
                      itemBuilder: (context, index){
                        return Dismissible(
                            direction: DismissDirection.horizontal,
                            onDismissed: (_){},
                            key: Key(
                                index.toString()
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
                            child: TaskWidget(task: Task(
                                id: "1",
                                title: "Home Task",
                                subtitle: "Cleaning",
                                createdAtTime: DateTime.now(),
                                createdAtDate: DateTime.now(),
                                isCompleted: false
                            ),)
                        );
                      }) :  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(
                              'assets/lottie/1.json'
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






