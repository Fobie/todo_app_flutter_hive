import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/view_items/homepage_view_items/homepage_view_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SizedBox(
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
              child: ListView.builder(
                itemCount: 20,
                  itemBuilder: (context, index){
                    return AnimatedContainer(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        duration: const Duration(milliseconds: 600),
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
                        ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    //  floating button
      floatingActionButton: FloatingActionButtonItemView(),
    );
  }
}




