import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/main_provider.dart';

import '../app_colors.dart';

class AppTheme{
  static const Color primaryColor=Color(0xffDFECDB);
  static const Color primaryColorDark=Color(0xff060E1E);
  static const Color secondaryColor=Color(0xff5D9CEC);

static  bool isDone=false;



  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color:Colors.white),
      bodyMedium: TextStyle(fontSize: 25,color: secondaryColor,fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 20,color: AppColors.grye),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white
    ),
    iconTheme: IconThemeData(


    )




  );

  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: primaryColorDark,
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
          bodyMedium: TextStyle(fontSize: 25,color: secondaryColor,fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 20,color: AppColors.grye),
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)

      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColorDark
    ),



  );




}