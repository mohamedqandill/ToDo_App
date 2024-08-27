import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/core/models/firebase_models.dart';
import 'package:todo_app/provider/main_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class EditBottomSheet extends StatelessWidget {
  TaskModel taskModel;

   EditBottomSheet({super.key,required this.taskModel});
  GlobalKey<FormState> formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        var pro=Provider.of<ThemeProvider>(context);
        return Container(
          padding: EdgeInsets.all(20),
          height: 510,
          width: double.infinity,
          decoration: BoxDecoration(
              color: pro.mode==ThemeMode.light?Colors.white:AppColors.darkPrimary

          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "editTask".tr(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if(value==null||value.trim().isEmpty){
                    return "invalid title";
                  }
                },
                onChanged: (val){
                  taskModel.title=val;
                },
                decoration: InputDecoration(
                    label: Text(
                      "taskTitle".tr(),
                      style:Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.black, width: 4),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if(value==null||value.trim().isEmpty){
                    return "invalid descreption";
                  }
                },
                onChanged: (val){
                  taskModel.desc=val;
                },
                decoration: InputDecoration(
                    label: Text(
                      "taskDesc".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.black, width: 4),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "date".tr(),
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                      context: context,
                      initialDate: provider.selectedDatePiker,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365))).then((value) {
                    return provider.setDatePiker(value!);
                  });
                },
                child: Text(
                  provider.selectedDatePiker.toString().substring(0,10),
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "time".tr(),
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showTimePicker(context: context, initialTime: provider.selectedTime).then((value) {
                    provider.setTime(value!);
                  });
                },
                child: Text(
                 "${provider.selectedTime.hour}:${provider.selectedTime.minute}",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

              Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    taskModel.time=provider.selectedTime.toString().substring(10,15);
                    provider.editTask(taskModel);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "update".tr(),
                    style: TextStyle(fontSize: 25),
                  ))
            ],
          ),
        );
      },
    );
  }
}


