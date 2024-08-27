import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/modules/screens/create_account_screen.dart';
import 'package:todo_app/provider/auth_provider.dart';

import '../widgets/customField/custom_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "login".tr(),
                      style: theme.titleMedium,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomField(
                        controller:provider.emailController ,
                        text: "email".tr(),icon: IconButton(onPressed: (){}, icon: SizedBox())),
                    SizedBox(
                      height: 30,
                    ),
                    CustomField(
                        controller: provider.passwordController,
                        text: "pass".tr(),icon: IconButton(onPressed: (){}, icon: SizedBox())),
                    SizedBox(height: 20,),

                    InkWell(
                      onTap: (){
                        provider.Login(context);


                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(22)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "login".tr(),
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Icon(Icons.logout,size: 30,color: Colors.black,)
                          ],
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap: (){
                          provider.resetPassword();
                        },
                        child: Text("forget".tr(),style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, CreateAccountScreen.routeName);
                        },
                        child: Text(
                          "check2".tr(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
