import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                context.setLocale(Locale("en"));
              },
              child: Row(
                children: [
                  Text("english".tr(),style: Theme.of(context).textTheme.bodyMedium,),
                  Spacer(),
                  context.locale==Locale("en")?Icon(Icons.done):SizedBox()
                ],
              ),
            ),

            InkWell(
              onTap: (){
                context.setLocale(Locale("ar"));
              },
              child: Row(
                children: [
                  Text("arabic".tr(),style: Theme.of(context).textTheme.bodyMedium,),
                  Spacer(),
                  context.locale==Locale("ar")?Icon(Icons.done):SizedBox()
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
