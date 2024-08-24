import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/UI/core/Theme/app_theme.dart';
import 'package:todo_app/UI/modules/screens/create_account_screen.dart';
import 'package:todo_app/UI/modules/screens/home_screen.dart';
import 'package:todo_app/UI/modules/screens/login_screen.dart';
import 'package:todo_app/UI/modules/splash/splash_screen.dart';
import 'package:todo_app/provider/theme_provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPrefernces = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      EasyLocalization(
        supportedLocales: [Locale("en"), Locale("ar")],
        path: 'assets/translations',
        startLocale: Locale("en"),
        saveLocale: true,
        // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),

        child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(sharedPrefernces),
        child: const MyApp()),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: pro.mode,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SplashScreen.routeName:(_)=>SplashScreen(),
        CreateAccountScreen.routeName:(_)=>CreateAccountScreen(),
        LoginScreen.routeName:(_)=>LoginScreen(),
      },
      initialRoute: SplashScreen.routeName,


    );
  }
}

