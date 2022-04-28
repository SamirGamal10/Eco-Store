// ignore_for_file: must_be_immutable

import 'package:e_commerce/admin/adminhome.dart';
import 'package:e_commerce/layout/layout.dart';
import 'package:e_commerce/register/register.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/network/local/cach_helper.dart';
import 'package:e_commerce/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var adminPassword = 'admin123';
  var adminEmail = 'admin2000@gmail.com';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {
        var cubit = ShopAppCubit.get(context);

        if (state is LoginSuccessStates) {
          if (cubit.isAdmin) {
            showToast(text: "Hello Admin", state: Toaststate.success, time: 5);

            navgateAndFinsh(context, const AdminPage());
          } else {
            showToast(
                text: "تم التسجيل بنجاح", state: Toaststate.success, time: 5);
            CachHelper.saveData(key: 'uid', value: state.uid).then((value) {
              navgateAndFinsh(context, const LayOut());
            });
          }
        } else if (state is LoginErrorStates) {
          showToast(
              text: "لا يوجد حساب بهذه المواصفات",
              state: Toaststate.error,
              time: 5);
        }
      },
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);

        return Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: cubit.loginkey,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage(
                        'assets/icons/buyicon.png',
                      )),
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 18,
                            color: HexColor('#7D7E7B'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultTextFromField(
                        controller: cubit.emailController,
                        type: TextInputType.emailAddress,
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultTextFromField(
                        controller: cubit.passwordcontroller,
                        type: TextInputType.visiblePassword,
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        ispassword: cubit.isPassword,
                        suffixIcon: cubit.isPassword
                            ? (Icons.remove_red_eye)
                            : (Icons.remove_red_eye_outlined),
                        onPressedSuffix: () {
                          cubit.changIconPassword();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      bottom(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                        function: () {
                          validate(context);
                        },
                        text: 'login'.toUpperCase(),
                        fontSize: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t Have Account ??'),
                          TextButton(
                            onPressed: () {
                              navgateAndFinsh(context, const RegisterScreen());
                            },
                            child: const Text('REGISTER'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.changeIsAdmin(true);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.circle,
                                    color: cubit.isAdmin
                                        ? Colors.black
                                        : HexColor('#DEE3E3')),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Admin',
                                  style: GoogleFonts.inconsolata(
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                cubit.changeIsAdmin(false);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.circle,

                                      color: cubit.isAdmin
                                          ? HexColor('#DEE3E3')
                                          : Colors.black),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'user',
                                    style: GoogleFonts.inconsolata(
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void validate(BuildContext context) {
    var cubit = ShopAppCubit.get(context);
    // cubit.changeIsLoading(true);
    if (cubit.loginkey.currentState!.validate()) {
      cubit.loginkey.currentState!.save();
      if (cubit.isAdmin) {
        if (cubit.passwordcontroller.text == adminPassword &&
            cubit.emailController.text == adminEmail) {
          try {
          cubit.userLogin(
              emailAddress: cubit.emailController.text,
              password: cubit.passwordcontroller.text);


          } catch (e) {
            // cubit.changeIsLoading(false);
            showToast(text: e.toString(), state: Toaststate.error, time: 5);
          }
        } else {
          cubit.changeIsLoading(false);
          showToast(text: "Some Thing Error", state: Toaststate.error, time: 5);
        }
      } else {
        try {
        cubit.userLogin(
            emailAddress: cubit.emailController.text,
            password: cubit.passwordcontroller.text);
        } catch (e) {
          showToast(text: e.toString(), state: Toaststate.error, time: 5);
        }
      }
    }
    cubit.changeIsLoading(false);
  }
}
