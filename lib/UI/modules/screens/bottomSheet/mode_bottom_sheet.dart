import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class ModeBottomSheet extends StatelessWidget {
  const ModeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,

          children: [
            InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.light);

              },
              child: Row(
                children: [
                  Text("light".tr(),style: Theme.of(context).textTheme.bodyMedium,),
                  Spacer(),
                  pro.mode==ThemeMode.light?Icon(Icons.done):SizedBox()
                ],
              ),
            ),

            InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.dark);

              },
              child: Row(
                children: [
                  Text("dark".tr(),style: Theme.of(context).textTheme.bodyMedium,),
                  Spacer(),
                 pro.mode==ThemeMode.dark? Icon(Icons.done):SizedBox()
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
