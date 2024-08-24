


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/UI/core/Services/firebase_functions.dart';
import 'package:todo_app/UI/core/models/firebase_models.dart';
import 'package:todo_app/UI/core/models/user_models.dart';
import 'package:todo_app/UI/modules/screens/create_account_screen.dart';

import '../UI/modules/screens/settings_screen.dart';
import '../UI/modules/screens/task_screen.dart';

class MainProvider extends ChangeNotifier{

  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  int selectedIndex=0;
  DateTime selectedDatePiker=DateTime.now();
  DateTime setDateTime=DateTime.now();
  TimeOfDay selectedTime=TimeOfDay.now();
  TimeOfDay newselectedTime=TimeOfDay.now();
  Color color=Colors.blue;

  UserModel? user;

  List<Widget> screen=[
    TaskScreen(),
    SettingsScreen()
  ];


  void setIndex(int index){
    selectedIndex=index;
    notifyListeners();
  }

  void setDate(DateTime dateTime){
    setDateTime=DateUtils.dateOnly(dateTime);
    notifyListeners();
  }

  void setTime(TimeOfDay dateTime){
    selectedTime=dateTime;
    notifyListeners();
  }

  void setDatePiker(DateTime dateTime){
    selectedDatePiker=DateUtils.dateOnly(dateTime);
    notifyListeners();
  }

  void addTask()async{
    TaskModel taskModel=TaskModel(
        // color: color,
        title: titleController.text,
        time: "${selectedTime.hour} : ${selectedTime.minute}",
        desc: descController.text,
        date:DateUtils.dateOnly(selectedDatePiker).millisecondsSinceEpoch ,
        isDone: false);
    await FirebaseFunctions.addTask(taskModel);
    titleController.clear();
    descController.clear();
    // notifyListeners();
  }



  void editTask(TaskModel taskModel){
    FirebaseFunctions.editTaskDetails(taskModel);
    notifyListeners();


  }

  Stream<QuerySnapshot<TaskModel>> getTask(){
    return FirebaseFunctions.getTask(setDateTime);


  }

  void deleteTask(String id)async{
    FirebaseFunctions.deleteTask(id);
    // notifyListeners();
  }

  void isDone( TaskModel task){
    FirebaseFunctions.isDone(task);
    // notifyListeners();
  }

  void logout(BuildContext context){
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, CreateAccountScreen.routeName, (route) => false);
    notifyListeners();
  }

  void getUser()async{
    user=await FirebaseFunctions.getUser();
    notifyListeners();
  }







}