// ignore_for_file: unused_local_variable

import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bag extends StatelessWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);
          return const Scaffold(
            body: Center(
              child: Text('BagPage'),
            ),
          );
        });
  }
}
