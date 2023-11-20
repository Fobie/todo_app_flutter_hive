import 'package:flutter/material.dart';
import 'package:todoapp/const/colors.dart';
import 'package:todoapp/models/drawer_contents.dart';

class CustomSliderDrawer extends StatelessWidget {
  const CustomSliderDrawer({super.key});

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
