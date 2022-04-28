// ignore_for_file: unused_local_variable
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProducts extends StatelessWidget {
    const AddProducts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);

          return Scaffold(
            backgroundColor: mainColor,
            appBar: AppBar(
              backgroundColor: mainColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: cubit.productKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      defaultTextFromField(
                          controller: cubit.productNameController,
                          type: TextInputType.text,
                          labelText: 'Product Name',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Name of Product';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFromField(
                        controller: cubit.productPriceController,
                        type: TextInputType.text,
                        labelText: 'Product Price',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Price of Product';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFromField(
                        controller:cubit. productDescriptionController,
                        type: TextInputType.text,
                        labelText: 'Product Description',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Description of Product';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFromField(
                        controller: cubit.productCategoryController,
                        type: TextInputType.text,
                        labelText: 'Product Category',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Category of Product';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultTextFromField(
                        controller: cubit.productLocationController,
                        type: TextInputType.text,
                        labelText: 'Product Location',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Location of Product';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      bottom(
                          function: () {

                            if(cubit.productKey.currentState!.validate())
                              {
                                cubit.productKey.currentState!.save();

                                cubit.adminCreate(
                                  productName:cubit.productNameController.text,
                                  productLocation:cubit.productLocationController.text,
                                  productDescription:cubit.productDescriptionController.text,
                                  productPrice:cubit.productPriceController.text,
                                  productCategory:cubit.productCategoryController.text,



                                   );




                              }
                          },
                        color: Colors.blue,
                        text: 'Add Product',
                        fontSize: 20,
                        width: 200,

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
