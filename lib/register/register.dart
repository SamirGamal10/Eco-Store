
import 'package:e_commerce/emailVerified/emailVerified.dart';
import 'package:e_commerce/login/login.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {
        // if (state is RegisterSuccessStates) {
        //   navgateAndFinsh(context, const EmailVerified());
        // }
      },
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);

        return Scaffold(
          backgroundColor:mainColor,
          appBar: AppBar(
            backgroundColor:mainColor,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.registerkey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage('assets/icons/user2.png')),
                      Text(
                        'Register'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Register to join our community',
                          style: TextStyle(
                            fontSize: 18,
                            color: HexColor('#7D7E7B'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFromField(
                        controller: cubit.userName,
                        type: TextInputType.text,
                        labelText: 'User Name',
                        prefixIcon: const Icon(Icons.person),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter Name';
                          } else if (value.length < 6) {
                            return 'Name Is Too short';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
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
                          } else if (value.length < 6) {
                            return 'password is too weak   (must be more 8 character)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultTextFromField(
                        controller: cubit.phone,
                        type: TextInputType.number,
                        labelText: 'Phone number',
                        prefixIcon: const Icon(Icons.phone),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your number';
                          } else if (value.length > 11 || value.length < 11) {
                            return 'Phone number must have 11 number';
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
                          if (cubit.registerkey.currentState!.validate()) {
                            cubit.userRegister(
                              userName: cubit.userName.text,
                              emailAddress: cubit.emailController.text,
                              password: cubit.passwordcontroller.text,
                              phone: cubit.phone.text,
                            );
                          }
                          navgateAndFinsh(context, const EmailVerified());
                        },
                        text: 'Register'.toUpperCase(),
                        fontSize: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('I Have already Account ??'),
                          TextButton(
                            onPressed: () {
                              navgateTo(context,  LoginScreen());
                            },
                            child: const Text('Login'),
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
}
