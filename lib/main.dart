import 'package:bmi/home/home_screen.dart';
import 'package:bmi/shared/cache_helper.dart';
import 'package:bmi/shared/caches.dart';
import 'package:bmi/shared/them.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  bool? isDarkMode = CacheHelper.getData(Caches.isDarkMode);
  if(isDarkMode == null) {
    await CacheHelper.setData(Caches.isDarkMode, true);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CacheHelper.getData(Caches.isDarkMode);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: MyThemes(context, isDarkMode? ThemType.dark : ThemType.light).theme,
      home: HomeScreen(onState: (){setState(() {});},),
    );
  }
}
