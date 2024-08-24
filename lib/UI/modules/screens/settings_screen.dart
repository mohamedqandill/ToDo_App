import 'package:flutter/material.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/language_bottom_sheet.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/mode_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Language",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return LanguageBottomSheet();
                  },
                );
              },
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary)),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Mode",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModeBottomSheet();
                  },
                );
              },
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary)),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Light",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
