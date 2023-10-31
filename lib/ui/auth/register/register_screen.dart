import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/auth/login/login_screen.dart';
import 'package:flutter_ecommerce_app/ui/utils/app_theme.dart';
import 'package:flutter_ecommerce_app/ui/utils/text_field_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController(text: 'osama');

  var emailController = TextEditingController(text: 'osama@route.com');

  var passwordController = TextEditingController(text: '123456');

  var confirmationController = TextEditingController(text: '123456');

  var formkey = GlobalKey<FormState>();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 130.h, bottom: 46.h, left: 97.h, right: 97.h),
            child: Image.asset(
              'assets/images/route.png',
            ),
          ),
          Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    TextFieldItem(
                      label: 'User Name',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter User Name';
                        }
                        return null;
                      },
                      hintText: '',
                    ),
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
                      hintText: 'Enter your password',
                      controller: passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (text.trim().length < 6 || text.trim().length > 30) {
                          return 'Password should be > 6 & < 30 ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      isObscure: isObscure,
                      suffixIcon: InkWell(
                        child: isObscure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onTap: () {
                          if (isObscure) {
                            isObscure = false;
                          } else {
                            isObscure = true;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    TextFieldItem(
                      label: 'Confirmation Password',
                      controller: confirmationController,
                      isObscure: true,
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Confirmation Password';
                        }
                        if (text != passwordController.text) {
                          return "Password doesn't Match";
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
                            'Register',
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
                          "Already have an account? ",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: MyTheme.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName);
                            },
                            child: Text('SignIn',
                                style: Theme.of(context).textTheme.titleMedium?.
                                copyWith(color: MyTheme.white)))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
