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
                         "Create Account",
                         style: theme.titleMedium,
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(

                         controller: provider.nameController,
                         icon: IconButton(onPressed: (){}, icon: SizedBox()),
                         text: "Name",
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(
                           controller: provider.emailController,
                           text: "Email",icon: IconButton(onPressed: (){}, icon: SizedBox())),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(
                           controller: provider.passwordController,
                           text: "Password",isSecure: provider.isSecure,icon: IconButton(onPressed: (){provider.ChangeSecure();}, icon: (Icon(provider.isSecure?Icons.visibility_off:Icons.visibility)))),
                       SizedBox(
                         height: 30,
                       ),
                       CustomField(
                          controller: provider.phoneController,
                           text: "Phone",icon: IconButton(onPressed: (){}, icon: SizedBox())),
                       SizedBox(
                         height: 20,
                       ),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                               fixedSize: Size(250, 35),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20))),
                           onPressed: () {
                             if(formState.currentState!.validate()){
                               provider.CreateAccount(context);
                             }

                           },
                           child: Text(
                             "Create Account",
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                           )),
                       Spacer(),
                       InkWell(
                           onTap: (){
                             Navigator.pushNamed(context, LoginScreen.routeName);
                           },
                           child: Text(
                             "Are you have an account..? Login",
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
