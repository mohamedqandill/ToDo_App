import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/provider/main_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class TaskBottomSheet extends StatefulWidget {
   const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

  DateTime selectedDate=DateTime.now();
GlobalKey<FormState> formKey=GlobalKey<FormState>();
class _TaskBottomSheetState extends State<TaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        var pro=Provider.of<ThemeProvider>(context);
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 490,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: pro.mode==ThemeMode.light?Colors.white:AppColors.darkPrimary

            ),
            child: Form(
              key:formKey ,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "addTask".tr(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value==null||value.trim().isEmpty ){
                        return "invalid title";

                      }
                    },
                    controller: provider.titleController,
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
                    controller: provider.descController,
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
                      print(provider.selectedDatePiker);
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
                    "${provider.selectedTime.hour}: ${provider.selectedTime.minute}",
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
                        if(formKey.currentState!.validate()){
                          provider.addTask();
                          Navigator.pop(context);

                        }

                      },
                      child: Text(
                        "add".tr(),
                        style: TextStyle(fontSize: 25),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
