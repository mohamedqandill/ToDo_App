


import 'package:flutter/material.dart';

import '../UI/modules/screens/settings_screen.dart';
import '../UI/modules/screens/task_screen.dart';

class MainProvider extends ChangeNotifier{

  int selectedIndex=0;
  DateTime setTime=DateTime.now();
  List<Widget> screen=[
    TaskScreen(),
    SettingsScreen()
  ];
  DateTime selectedDatePiker=DateTime.now();

  void setIndex(int index){
    selectedIndex=index;
    notifyListeners();
  }

  void setDate(DateTime dateTime){
    setTime=dateTime;
    notifyListeners();
  }

  void setDatePiker(DateTime dateTime){
    selectedDatePiker=dateTime;
    notifyListeners();
  }


}