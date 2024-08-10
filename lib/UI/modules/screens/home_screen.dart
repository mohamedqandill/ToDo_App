import 'package:flutter/material.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/task_bottom_sheet.dart';
import 'package:todo_app/UI/modules/screens/settings_screen.dart';
import 'package:todo_app/UI/modules/screens/task_screen.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          "ToDo App",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white,width: 4)
        ),
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context) {
            return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TaskBottomSheet());

          },);


        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.primary,


      ),

      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor: AppColors.grye,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (value){
            selectedIndex=value;
            setState(() {

            });

          },

          items: [
            BottomNavigationBarItem(icon:Icon(Icons.menu),label: "Tasks"),
            BottomNavigationBarItem(icon:Icon(Icons.settings),label: "Settings"),
          ],
        ),
      ),
      body: screen[selectedIndex],


    );
  }
  List<Widget> screen=[
    TaskScreen(),
    SettingsScreen()
  ];
}
