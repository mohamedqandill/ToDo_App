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
            Row(
              children: [
                Text("English",style: Theme.of(context).textTheme.bodyMedium,),
                Spacer(),
                Icon(Icons.done)
              ],
            ),

            Row(
              children: [
                Text("Arabic",style: Theme.of(context).textTheme.bodyMedium,),
                Spacer(),
                Icon(Icons.done)
              ],
            )
          ],

        ),
      ),
    );
  }
}
