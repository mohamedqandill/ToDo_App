import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/modules/screens/task_item.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(

        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: AppColors.primary,
              ),
              CalendarTimeline(

                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) => print(date),
                leftMargin: 90,
                monthColor: Colors.white,
                dayColor: AppColors.primary,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: AppColors.primary,
                // dotsColor: Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              )
            ],
          ),
          SizedBox(height: 30,),

          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
              return TaskItem();

            }, separatorBuilder: (context, index) => SizedBox(height: 20,), itemCount: 30),
          )

        ],
      ),


    );
  }
}
