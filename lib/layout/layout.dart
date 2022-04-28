import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayOut extends StatelessWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return Scaffold(

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              items: cubit.botNavBar,
            ),
            body: cubit.screen[cubit.currentindex]);
      },
    );
  }
}
