import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/UI/modules/screens/create_account_screen.dart';
import 'package:todo_app/UI/modules/screens/home_screen.dart';
import 'package:todo_app/UI/modules/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if(FirebaseAuth.instance.currentUser !=null){
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        }
        else{
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        }
      }
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffDFECDB),
      body: Center(
        child: Image.asset("assets/logo/logo.png"),
      ),
    );
  }
}
