import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/models/drawer_contents.dart';
import 'package:todoapp/pages/task_view_screen.dart';

//Floating action button
class FloatingActionButtonItemView extends StatelessWidget {
  const FloatingActionButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => TaskViewScreen());
      },
      child: Material(
        color: Colors.transparent,
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

//Task Info 
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

//Appbar
class AppBarItemView extends StatefulWidget {
  const AppBarItemView({super.key, required this.dKey});
  final GlobalKey<SliderDrawerState> dKey ;

  @override
  State<AppBarItemView> createState() => _AppBarItemViewState();
}

class _AppBarItemViewState extends State<AppBarItemView> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onDrawerToggle(){
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if(isDrawerOpen){
        animationController.forward();
        widget.dKey.currentState!.openSlider();
      } else {
        animationController.reverse();
        widget.dKey.currentState!.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: onDrawerToggle,
                icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: animationController,
                    size: 30,
                )
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.delete_forever,
                  size:30
                )
            )
          ],
        ),
      ),
    );
  }
}

//Slider Drawer
class DrawerItemView extends StatelessWidget {
  const DrawerItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: kPrimaryGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
        )
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/101491457?v=4'),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Win Khant Paing',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'Flutter Developer',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listsDrawerContent.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      print('${listsDrawerContent[index].title} Items');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(listsDrawerContent[index].icon, color: kWhiteColor,),
                        title: Text(
                          listsDrawerContent[index].title,
                          style: TextStyle(
                            color: kWhiteColor
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

