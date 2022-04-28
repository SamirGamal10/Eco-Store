// ignore_for_file: file_names

import 'package:e_commerce/login/login.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class EmailVerified extends StatelessWidget {
  const EmailVerified({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {
        if (state is ShopGetUserSuccess) {
          navgateAndFinsh(context,  LoginScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor('#DEE3E3'),
          appBar: AppBar(
            backgroundColor: HexColor('#DEE3E3'),
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                color: Colors.amber.withOpacity(.6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'please verify your email',
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification()
                              .then((value) {
                            showToast(
                              text: 'check your mail',
                              state: Toaststate.warning,
                              time: 10,
                            );
                          }).catchError((error) {});
                          navgateAndFinsh(context,  LoginScreen());
                        },
                        child: const Text('SEND'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
