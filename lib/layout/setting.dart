// ignore_for_file: unused_local_variable
import 'package:e_commerce/layout/about.dart';
import 'package:e_commerce/layout/layout.dart';
import 'package:e_commerce/layout/mylocation.dart';
import 'package:e_commerce/layout/myprofile.dart';
import 'package:e_commerce/login/login.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/network/local/cach_helper.dart';
import 'package:e_commerce/shared/styles/iconbroken.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);

          return Scaffold(
            // appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Home,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Home',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navgateTo(
                            context,
                            Myprofile(
                              key: key,
                            ));
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Profile,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'MY Profile',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navgateTo(context, const Location());
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Location,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Location',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Heart,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Favorate',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.shopping_cart_checkout,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cart',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Chat,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Chat',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Call,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Connect us',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navgateTo(context, const About());
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Info_Circle,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'About',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ShopAppCubit.get(context).changeMode();
                        navgateAndFinsh(
                            context,
                            LayOut(
                              key: key,
                            ));
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.dark_mode_outlined,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Dark Mode',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        CachHelper.removeData(key: 'uid').then((value) {
                          if (value) {
                            navgateAndFinsh(context, LoginScreen());
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.Logout,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'LogOut',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
