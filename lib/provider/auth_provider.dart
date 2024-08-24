import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/UI/core/Services/firebase_functions.dart';
import 'package:todo_app/UI/modules/screens/home_screen.dart';

class AuthProvider extends ChangeNotifier{

  bool isSecure=true;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController nameController=TextEditingController();

  ChangeSecure(){
    isSecure=!isSecure;
    notifyListeners();
  }

  void CreateAccount(BuildContext context)async{
    UserCredential user = await FirebaseFunctions.createAccount(emailController.text, passwordController.text,phoneController.text,nameController.text);
   try{
     if(user.user !=null){
       Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

       final snackBar = SnackBar(
         /// need to set following properties for best effect of awesome_snackbar_content
         elevation: 0,
         behavior: SnackBarBehavior.floating,
         backgroundColor: Colors.transparent,
         content: AwesomeSnackbarContent(
           title: 'Welcome...',
           message:
           'Welcome',

           /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
           contentType: ContentType.success,
         ),
       );
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(snackBar);


     }
   }

  catch(e){
  final snackBar = SnackBar(
  /// need to set following properties for best effect of awesome_snackbar_content
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
  title: 'Error...',
  message:
  'Email or Password is not correct',

  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
  contentType: ContentType.failure,
  ),
  );
  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(snackBar);

       }
  }


  void Login(BuildContext context)async{
   try{
     UserCredential user= await FirebaseFunctions.Login(emailController.text, passwordController.text);
     if(user.user !=null){
       Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

       final snackBar = SnackBar(
         /// need to set following properties for best effect of awesome_snackbar_content
         elevation: 0,
         behavior: SnackBarBehavior.floating,
         backgroundColor: Colors.transparent,
         content: AwesomeSnackbarContent(
           title: 'Welcome...',
           message:
           'Welcome',

           /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
           contentType: ContentType.success,
         ),
       );
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(snackBar);


     }

   }
   catch(e){
     final snackBar = SnackBar(
       /// need to set following properties for best effect of awesome_snackbar_content
       elevation: 0,
       behavior: SnackBarBehavior.floating,
       backgroundColor: Colors.transparent,
       content: AwesomeSnackbarContent(
         title: 'Error...',
         message:
         'Email or Password is not correct',

         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
         contentType: ContentType.failure,
       ),
     );
     ScaffoldMessenger.of(context)
       ..hideCurrentSnackBar()
       ..showSnackBar(snackBar);

   }

  }

  void resetPassword(){
    FirebaseFunctions.resetPassword(emailController.text);
  }


}