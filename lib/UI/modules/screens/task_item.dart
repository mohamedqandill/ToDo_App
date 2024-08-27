import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/core/Theme/app_theme.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/core/models/firebase_models.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/edit_task_bottom_sheet.dart';
import 'package:todo_app/provider/main_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ThemeProvider>(context);
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Container(
          width: double.infinity,
          height: 115,
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: pro.mode == ThemeMode.light
                ? Colors.white
                : AppColors.darkPrimary,
          ),
          child: Slidable(
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              extentRatio: 0.7,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    provider.deleteTask(taskModel.id);
                  },
                  label: "delete".tr(),
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  autoClose: true,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                SlidableAction(
                  onPressed: (context) {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(42),topRight: Radius.circular(42))
                      ),
                      isDismissible: true,
                      elevation: 5,
                      showDragHandle: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return ChangeNotifierProvider.value(
                            value: provider, child: Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

                            child: EditBottomSheet(taskModel:taskModel ,)));
                      },
                    );
                  },
                  label: "edit".tr(),
                  backgroundColor: Colors.blue,
                  icon: Icons.edit,
                  autoClose: true,
                )
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 5,
                  height: 80,
                  decoration: BoxDecoration(
                      color:taskModel.isDone?Colors.green :AppColors.primary,
                      borderRadius: BorderRadius.circular(12)),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      taskModel.isDone?Text(taskModel.title,style: TextStyle(fontSize: 25,color: Colors.green),):Text(

                        taskModel.title,
                        style:Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(taskModel.desc,
                          style: Theme.of(context).textTheme.bodySmall),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Icon(Icons.timelapse_outlined),
                          SizedBox(width: 3,),
                          Text(taskModel.time,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: taskModel.isDone?Colors.green:Colors.blue),)
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    provider.isDone(taskModel);
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child:taskModel.isDone? Text("done".tr(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),):ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: taskModel.isDone
                                  ? Colors.green
                                  : provider.color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            provider.isDone(taskModel);

                          },
                          child: taskModel.isDone
                              ? Stack(
                                children: [
                                  Text(
                                    "Done!",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),

                                ],
                              )
                              : Icon(
                                  Icons.done,
                                ))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
