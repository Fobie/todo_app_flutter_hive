import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/generated/assets.dart';
import 'package:todoapp/view_items/homepage_view_items/homepage_view_items.dart';
import 'package:todoapp/widgets/task_widget.dart';

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
        appBar: AppBarItemView(dKey: dKey,),
          slider: DrawerItemView(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                TasksInfoItemView(),
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
                              child: TaskWidget()
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
          )
      ),
    //  floating button
      floatingActionButton: FloatingActionButtonItemView(),
    );
  }
}






