import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/my_theme_data.dart';
import 'package:provider/provider.dart';
import '';
void main(){
  runApp(News_app());

}

class News_app extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: MyThemeData.lightTheme ,
      initialRoute:HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen()
      },

    );
  }
}