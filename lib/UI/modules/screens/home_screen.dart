import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/core/Theme/app_theme.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/task_bottom_sheet.dart';
import 'package:todo_app/UI/modules/screens/settings_screen.dart';
import 'package:todo_app/UI/modules/screens/task_screen.dart';
import 'package:todo_app/provider/main_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName="Home";

   HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => MainProvider()..getUser(),
      child: Selector<MainProvider,int>(
        selector: (p0, p1) => p1.selectedIndex,
        builder: (context, selectedIndex, child) {
          var provider=Provider.of<MainProvider>(context);
          var pro=Provider.of<ThemeProvider>(context);
          return Scaffold(
            extendBody: true,
            backgroundColor: AppColors.secondary,
            appBar: AppBar(
              toolbarHeight: 70,
              elevation: 0,
              title: Text(
                "${"hi".tr()}, ${provider.user?.name??""}".toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              // centerTitle: true,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color:pro.mode==ThemeMode.light? Colors.white:AppColors.darkPrimary,width: 4)
              ),
              onPressed: (){
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(42),topRight: Radius.circular(42))
                  ),
                  isDismissible: true,
                  elevation: 5,
                  showDragHandle: true,
                  backgroundColor:  pro.mode==ThemeMode.light?Colors.white:AppColors.darkPrimary,
                  isScrollControlled: true,
                  context: context, builder: (context) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ChangeNotifierProvider.value(
                        value: provider,

                          child: TaskBottomSheet()));

                },);


              },
              child: Icon(Icons.add),
              backgroundColor: AppColors.primary,


            ),

            bottomNavigationBar: BottomAppBar(
              color: pro.mode==ThemeMode.light?Colors.white:AppColors.darkPrimary,
              notchMargin: 8,
              shape: CircularNotchedRectangle(),
              padding: EdgeInsets.zero,
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                unselectedItemColor: AppColors.grye,
                showUnselectedLabels: false,
                currentIndex: selectedIndex,
                onTap:provider.setIndex,

                items: [
                  BottomNavigationBarItem(icon:Icon(Icons.menu,size: 30,),label: "Tasks"),
                  BottomNavigationBarItem(icon:Icon(Icons.settings,size: 30,),label: "Settings"),
                ],
              ),
            ),
            body: provider.screen[selectedIndex],


          );

        },
      ),
    );
  }


}
