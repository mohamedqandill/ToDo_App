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
                      "Login",
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
                        text: "Email",icon: IconButton(onPressed: (){}, icon: SizedBox())),
                    SizedBox(
                      height: 30,
                    ),
                    CustomField(
                        controller: provider.passwordController,
                        text: "Password",icon: IconButton(onPressed: (){}, icon: SizedBox())),
                    SizedBox(height: 20,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(250, 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          provider.Login(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    InkWell(
                        onTap: (){
                          provider.resetPassword();
                        },
                        child: Text("Forget Password..?",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, CreateAccountScreen.routeName);
                        },
                        child: Text(
                          "you not have an account..? Create Account",
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
