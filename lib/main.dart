import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/hive_data_store.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/view/home/home_page.dart';

Future<void> main() async{

  /// Initial Hive DB
  await Hive.initFlutter();

  /// Register Hive Adapter
  Hive.registerAdapter<Task>(TaskAdapter());

  /// Open box
  var box = await Hive.openBox<Task>("taskBox");

  /// Delete data from previous day
  // ignore: avoid_function_literals_in_foreach_calls
  box.values.forEach((task) {
    if (task.createdAtTime.day != DateTime.now().day) {
      task.delete();
    } else {}
  });

  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 17
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w300
          ),
          titleMedium: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w300
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: HomePage(),
    );
  }
}


