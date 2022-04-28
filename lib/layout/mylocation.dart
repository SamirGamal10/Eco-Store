// ignore_for_file: unused_local_variable
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);
          var userModel = cubit.userModel;
          return  Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                  Container(
                    alignment:Alignment.topCenter ,
                    height: 200,
                    width: double.infinity,

                    child:Column(
                      children:  [
                        Row(
                          children: [
                             Text("Name :",
                              style: GoogleFonts.abel(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width:55,
                            ),
                            Text(userModel!.userName,
                              style: GoogleFonts.abel(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height:25,
                        ),
                        Row(
                          children: [
                             Text("Address :",
                              style: GoogleFonts.abel(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              width:40,
                            ),
                            Text(userModel.location,
                              style: GoogleFonts.abel(
                                fontSize: 25,
                              ),),
                          ],
                        ),
                        const SizedBox(
                          height:25,
                        ),
                        Row(
                          children: [
                             Text("Mobile phone :",
                        style: GoogleFonts.abel(
                          fontSize: 25,
                        ),
                            ),
                            const SizedBox(
                              width:12,
                            ),
                            Text(userModel.phone,
                              style: GoogleFonts.abel(
                                fontSize: 25,
                              ),),
                          ],
                        )
                      ],
                    ) ,

                  ),

                ],
              ),
            ),
          );
        });
  }
}
