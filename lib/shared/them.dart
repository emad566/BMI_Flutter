import 'package:flutter/material.dart';

enum ThemType{
  dark,
  light
}

class MyThemes{
  ThemeData  theme = ThemeData();

  MyThemes(BuildContext context, ThemType type){
    if(type == ThemType.dark){
      theme = ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(
            color: Colors.white,
            size: 30
        ),
        textTheme: TextTheme(
          bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      );
    }else{

    }
  }
}
