import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/const/dimens.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.dKey});
  final GlobalKey<SliderDrawerState> dKey ;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with SingleTickerProviderStateMixin {
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

    var base = BaseWidget.of(context).dataStore;

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
                onPressed: (){
                  base.box.isNotEmpty ? deleteAllTask(context) : warningNoTask(context);
                },
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