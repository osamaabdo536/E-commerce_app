import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/auth/login/login_screen.dart';
import 'package:flutter_ecommerce_app/ui/auth/register/register_screen.dart';
import 'package:flutter_ecommerce_app/ui/home/home_screen.dart';
import 'package:flutter_ecommerce_app/ui/splash/splash_screen.dart';
import 'package:flutter_ecommerce_app/ui/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            SplashScreen.routeName : (context) => SplashScreen(),
            LoginScreen.routeName : (context) => LoginScreen(),
            RegisterScreen.routeName : (context) => RegisterScreen()
          },
          theme: MyTheme.appTheme,
        );
      },
    );
  }
}
