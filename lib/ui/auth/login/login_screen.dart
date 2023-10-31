import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/auth/register/register_screen.dart';
import 'package:flutter_ecommerce_app/ui/utils/app_theme.dart';
import 'package:flutter_ecommerce_app/ui/utils/text_field_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController(text: 'osama@route.com');

  var passwordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 130.h, bottom: 46.h, left: 97.h, right: 97.h),
              child: Image.asset(
                'assets/images/route.png',
              ),
            ),
            Text(
              'Welcome Back to Route',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Please Sign in with your e-mail',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      TextFieldItem(
                        label: 'Email Address',
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Email Address';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                        hintText: '',
                      ),
                      TextFieldItem(
                        label: 'Password',
                        controller: passwordController,
                        isObscure: true,
                        keyboardType: TextInputType.phone,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password';
                          }
                          if (text.length < 6) {
                            return 'Password should be at least 6 chars';
                          }
                          return null;
                        },
                        hintText: '',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              // register();
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                      ),
                       SizedBox(
                         height: MediaQuery.of(context).size.height * 0.01,
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account!? ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: MyTheme.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              child: Text('Create Account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: MyTheme.white)))
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
