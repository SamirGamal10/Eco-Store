// ignore_for_file: unused_local_variable
import 'package:e_commerce/admin/Addproduct.dart';
import 'package:e_commerce/admin/manageproducts.dart';
import 'package:e_commerce/admin/orderscreen.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, Object? state) {

        },
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
             backgroundColor: mainColor,
            ),
            backgroundColor: mainColor,

            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      const SizedBox(
                        height: 180,
                      ),
                      bottom(
                        function: () {
                          navgateTo(context, AddProducts());
                        },
                        width: 200,
                        text: 'Add Product',
                        color:HexColor('#D7DBDD'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      bottom(
                        function: () {

                           navgateTo(context, const ManageProducts());
                        },
                        width: 200,
                        text: 'Products',
                        color:HexColor('#D7DBDD'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      bottom(

                        function: () {
                          navgateTo(context, const Orders());
                        },
                        width: 200,
                        text: 'View orders',
                        color:HexColor('#D7DBDD'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
