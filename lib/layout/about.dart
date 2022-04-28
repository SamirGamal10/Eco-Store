// ignore_for_file: unused_local_variable

import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);
          return Scaffold(
              appBar: AppBar(

              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff746bc9),
                      ),
                    ),
                    const Image(
                      image: AssetImage("assets/images/about.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 280,
                      width: 360,
                      child: Wrap(
                        children: const [
                          Text(
                            "ECO Store ,This App You Can Buy Dress Shirt Shoes Pant And Tie And Many Other Product In Cheap Price, Now Its Time Buy SomeThing",
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );


        });
  }
}
