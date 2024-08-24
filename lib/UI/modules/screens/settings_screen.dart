import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/core/app_colors.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/language_bottom_sheet.dart';
import 'package:todo_app/UI/modules/screens/bottomSheet/mode_bottom_sheet.dart';
import 'package:todo_app/provider/main_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(

          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "language".tr(),
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
                              context.locale==Locale("en")?"english".tr():"arabic".tr(),
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
                  "theme".tr(),
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
                              pro.mode==ThemeMode.light?"light".tr():"dark".tr(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        )),
                  ),
                ),
                SizedBox(height: 50,),

                InkWell(
                    onTap: (){
                      provider.logout(context);
                    },
                    child: Icon(Icons.logout,size: 30,))

              ],
            ),
          ),
        );
      },
    );
  }
}
