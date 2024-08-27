
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/core/models/firebase_models.dart';
import 'package:todo_app/UI/modules/screens/task_item.dart';
import 'package:todo_app/provider/main_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        // var provider=Provider.of<MainProvider>(context);
        var pro=Provider.of<ThemeProvider>(context);
        return Scaffold(

          body: Column(

            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: AppColors.primary,
                  ),
                  EasyInfiniteDateTimeLine(

                      firstDate:FirebaseAuth.instance.currentUser!.metadata.creationTime! ,
                      focusDate:provider.setDateTime ,
                      lastDate:DateTime.now().add(Duration(days: 365)),
                    onDateChange: provider.setDate,

                    dayProps: EasyDayProps(
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Colors.white
                        )
                      )
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30,),



              StreamBuilder(
                stream: provider.getTask(), builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasError){
                  return Text("has Error");
                }
                else{

                  List<TaskModel> tasks=snapshot.data!.docs.map((e) => e.data()).toList();
                  print("tasks:$tasks");



                  return tasks.isEmpty? Center( heightFactor: 10,child: Text("No Tasks in this day"),):Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 15,),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                      return TaskItem(taskModel:tasks[index],);
                    },
                    ),
                  );
                }
              },
              ),


            ],
          ),


        );
      }
    );
  }
}
