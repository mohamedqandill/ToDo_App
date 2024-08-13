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
class _TaskBottomSheetState extends State<TaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        var pro=Provider.of<ThemeProvider>(context);
        return Container(
          padding: EdgeInsets.all(20),
          height: 390,
          width: double.infinity,
          decoration: BoxDecoration(
            color: pro.mode==ThemeMode.light?Colors.white:AppColors.darkPrimary

          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Task",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: Text(
                      "Task Title",
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
                decoration: InputDecoration(
                    label: Text(
                      "Task Descreption",
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
                "Select Time",
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
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {},
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 25),
                  ))
            ],
          ),
        );
      },
    );
  }

}
