import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/domain/use_case/register_use_case.dart';
import 'package:flutter_ecommerce_app/ui/auth/login/login_screen.dart';
import 'package:flutter_ecommerce_app/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:flutter_ecommerce_app/ui/auth/register/cubit/register_states.dart';
import 'package:flutter_ecommerce_app/ui/utils/app_theme.dart';
import 'package:flutter_ecommerce_app/ui/utils/dialog_utils.dart';
import 'package:flutter_ecommerce_app/ui/utils/text_field_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return
      BlocListener<RegisterScreenViewModel,RegisterStates>(
      bloc: viewModel,
        listener: (context,state){
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context,state.loadingMessage!);
        }else if(state is RegisterErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,posActionName: 'ok',title: 'fail');
        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.user?.name?? '',posActionName: 'ok',title: 'success');
        }
        },
        child: Scaffold(
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
                  key: viewModel.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                        TextFieldItem(
                          label: 'User Name',
                          controller: viewModel.nameController,
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
                          controller: viewModel.emailController,
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
                          controller: viewModel.passwordController,
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
                          isObscure: viewModel.isObscure,
                          suffixIcon: InkWell(
                            child: viewModel.isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              if (viewModel.isObscure) {
                                viewModel.isObscure = false;
                              } else {
                                viewModel.isObscure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        TextFieldItem(
                          label: 'Confirmation Password',
                          hintText: 'Enter your confirmation password',
                          controller: viewModel.confirmationController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please Enter Confirmation Password';
                            }
                            if (text != viewModel.passwordController.text) {
                              return "Password doesn't Match";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          isObscure: viewModel.isObscure,
                          suffixIcon: InkWell(
                            child: viewModel.isObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onTap: () {
                              if (viewModel.isObscure) {
                                viewModel.isObscure = false;
                              } else {
                                viewModel.isObscure = true;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                        TextFieldItem(
                          label: 'Phone',
                          controller: viewModel.phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Enter phone number';
                            }
                            if (text.trim().length < 11) {
                              return 'Please enter correct phone number';
                            }
                            if (text.trim().length > 11) {
                              return 'Please enter correct phone number';
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
                                viewModel.register();
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
        ),
    );
  }
}
