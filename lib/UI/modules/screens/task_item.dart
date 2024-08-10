import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/UI/core/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,

      ),

      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),
          extentRatio: 0.7,
          children: [
            SlidableAction(onPressed: (context){

            },
              label: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete,
              autoClose: true,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25)),

            ),
            SlidableAction(onPressed: (context){

            },
              label: "Edit",
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              autoClose: true,

            )
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: 5,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task Title",style: TextStyle(fontSize: 25,color: AppColors.primary),),
                  Text("Task descreption",style: TextStyle(fontSize: 20,color: AppColors.grye)),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),

                    onPressed: (){}, child: Icon(Icons.done)))
          ],
        ),
      ),


    );
  }
}