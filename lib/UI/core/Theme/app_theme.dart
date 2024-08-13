import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppTheme{
  static const Color primaryColor=Color(0xffDFECDB);
  static const Color primaryColorDark=Color(0xff060E1E);
  static const Color secondaryColor=Color(0xff5D9CEC);

  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: primaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
      bodyMedium: TextStyle(fontSize: 25,color: secondaryColor),
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
          bodyMedium: TextStyle(fontSize: 25,color: secondaryColor),
          bodySmall: TextStyle(fontSize: 20,color: AppColors.grye),
          titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)

      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColorDark
    ),



  );




}