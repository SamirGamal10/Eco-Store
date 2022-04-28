// ignore_for_file: unused_local_variable, unnecessary_string_interpolations

import 'package:e_commerce/layout/editprofile.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/styles/iconbroken.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopAppCubit.get(context);
    var userModel = cubit.userModel;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 190.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    child: Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            4.0,
                          ),
                          topRight: Radius.circular(
                            4.0,
                          ),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            userModel!.cover,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    alignment: AlignmentDirectional.topCenter,
                  ),
                  CircleAvatar(
                    radius: 64.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                        userModel.image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              userModel.userName,
              style: GoogleFonts.actor(
                fontSize: 27,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              userModel.location,
              style: GoogleFonts.actor(
                fontSize: 17,
                textStyle: TextStyle(
                  color: HexColor('#AAA9A9'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Photos',
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              OutlinedButton(
                onPressed: ()  {
                  // cubit.getUserData();
                  navgateTo(context, EditProfile());
                },
                child: const Icon(
                  IconBroken.Edit,
                  size: 16.0,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
