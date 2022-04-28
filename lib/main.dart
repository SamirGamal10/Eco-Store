// ignore_for_file: use_key_in_widget_constructors

import 'package:e_commerce/layout/layout.dart';
import 'package:e_commerce/login/login.dart';
import 'package:e_commerce/on_boarding/on_boarding_screen.dart';
import 'package:e_commerce/shared/bloc_observer.dart';
import 'package:e_commerce/shared/components/constants.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/network/local/cach_helper.dart';
import 'package:e_commerce/shared/network/remote/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {

  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CachHelper.init();
  Widget widget;
  onBoarding = CachHelper.getData(key: 'onboarding') ?? false;
  bool? isDark = CachHelper.getData(key: 'isDark') ?? false;
  uid = CachHelper.getData(key: 'uid') ?? "";

  if (onBoarding) {
    // no here
    if (uid != "") {
      widget = const LayOut();
    } else {
      widget =  LoginScreen();
    }
  } else {
    // go here
    widget = OnBoardingScreen(); // show it.
  }

  runApp(MyApp(
    startWidget: widget,
    onBoarding: onBoarding,
    isDark: isDark!,
  ));
}



class MyApp extends StatelessWidget {
  final bool onBoarding;
  final Widget startWidget;
  final bool isDark;
  const MyApp({
    required this.onBoarding,
    required this.startWidget,
    required this.isDark,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopAppCubit()

                ..getUserData()
              ..loadProducts()
              ..changeMode(fromshared: isDark)
        ),
      ],
      child: BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(




            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData.fallback(),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromARGB(255, 185, 16, 30),
                elevation: 20,
              ),

              textTheme: const TextTheme(

                headline4: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                color: HexColor('333739'),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 248, 244, 244)),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color(0xFFF80303),
                unselectedItemColor: Color(0xFFF0E7E7),
                backgroundColor: Color(0xFF3C3A3D),
              ),
              textTheme: const TextTheme(
                headline4: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: ShopAppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.ltr, child: startWidget),
          );
        },
      ),
    );
  }
}
