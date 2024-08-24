import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
   CustomField({super.key,required this.controller,required this.text,this.isSecure=false,required this.icon});

  String text;
  bool isSecure=false;
  IconButton icon=IconButton(onPressed: (){}, icon: SizedBox());

  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value) {
        if(value==null||value.trim().isEmpty){
          return "invalid ${text}";
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
        suffixIcon:icon ,
          labelText: text,
          hintText: text,

          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: 4,color: Colors.black)
          )
      ),
    );
  }
}
