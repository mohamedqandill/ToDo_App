import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/UI/modules/screens/login_screen.dart';
import 'package:todo_app/UI/modules/widgets/customField/custom_field.dart';
import 'package:todo_app/provider/auth_provider.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String routeName = "create";

   CreateAccountScreen({super.key});

   GlobalKey<FormState> formState=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<AuthProvider>(
               builder: (context, provider, child) {
                 return Form(
                   key: formState,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Spacer(
                         flex: 2,
                       ),
                       Text(
                         "create".tr(),
                         style: theme.titleMedium,
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(

                         controller: provider.nameController,
                         icon: IconButton(onPressed: (){}, icon: SizedBox()),
                         text: "name".tr(),
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(
                           controller: provider.emailController,
                           text: "email".tr(),icon: IconButton(onPressed: (){}, icon: SizedBox())),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(
                           controller: provider.passwordController,
                           text: "pass".tr(),isSecure: provider.isSecure,icon: IconButton(onPressed: (){provider.ChangeSecure();}, icon: (Icon(provider.isSecure?Icons.visibility_off:Icons.visibility)))),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(
                          controller: provider.phoneController,
                           text: "phone".tr(),icon: IconButton(onPressed: (){}, icon: SizedBox())),
                       SizedBox(
                         height: 20,
                       ),
                      InkWell(
                        onTap: (){
                             if(formState.currentState!.validate()){
                               provider.CreateAccount(context);
                             }

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
                                "create".tr(),
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Icon(Icons.logout,size: 30,color: Colors.black,)
                            ],
                          ),
                        ),
                      ),
                       Spacer(),
                       InkWell(
                           onTap: (){
                             Navigator.pushNamed(context, LoginScreen.routeName);
                           },
                           child: Text(
                             "check".tr(),
                             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                           ))
                     ],
                   ),
                 );
               },

            ),
          ),
        ),
      ),
    );
  }
}

