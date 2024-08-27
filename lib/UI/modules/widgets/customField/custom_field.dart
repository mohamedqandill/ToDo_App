import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class CustomField extends StatelessWidget {
   CustomField({super.key,required this.controller,required this.text,this.isSecure=false,required this.icon});

  String text;
  bool isSecure=false;
  IconButton icon=IconButton(onPressed: (){}, icon: SizedBox());

  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return TextFormField(

      validator: (value) {
        if(value==null||value.trim().isEmpty){
          return context.locale==Locale("en")?"${"invalid".tr()} ${text}":" ${text} ${"invalid".tr()} ";
        }
        else if(value.length<6&& text=="Password"){
          return "${text} must be > 6 letters";
        }
        if(text=="Email"&&!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)){
          return"${text} is not correct";
        }
        else{
          return null;
        }
      },
      controller: controller,
      obscureText: isSecure,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            
            color: pro.mode==ThemeMode.dark?Colors.blue:Colors.black,
            width: 3
          )
        ),


        suffixIcon:icon ,
          labelText: text,
          hintText: text,
          labelStyle: TextStyle(
              color: pro.mode==ThemeMode.light?Colors.black:Colors.blue
          ),
          hintStyle:  TextStyle(
              color: pro.mode==ThemeMode.light?Colors.black:Colors.blue
          ),

          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: 4,color: Colors.blue)
          )
      ),
    );
  }
}
