// ignore_for_file: unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin/editproduct.dart';
import 'package:e_commerce/models/shopmodel.dart';
import 'package:e_commerce/shared/components/components.dart';

import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = ShopAppCubit.get(context);


          return Scaffold(
            appBar: AppBar(),
            body: StreamBuilder<QuerySnapshot>(
              stream: cubit.loadProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product> products = [];
                  for (var doc in snapshot.data!.docs) {
                    var data = doc.data;
                    products.add(Product(
                      productId:doc.id,
                      productName: doc['productName'],
                      productCategory: doc['productCategory'],
                      productDescription: doc['productDescription'],
                      productLocation: doc['productLocation'],
                      productPrice: doc['productPrice'],

                    ));
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        onTapUp: (details) {
                          var left = details.globalPosition.dx;
                          var top = details.globalPosition.dy;
                          var right = MediaQuery.of(context).size.width - left;
                          var bottom = MediaQuery.of(context).size.width - top;
                          showMenu(
                            context: context,
                            position:
                                RelativeRect.fromLTRB(left, top, right, bottom),
                            items: [
                              MyPopupMenuItem(
                                  onClick: () {
                                     navgateTo(context,const EditProduct(),arguments: products[index]);
                                  }, child: const Text('Edit')),
                              MyPopupMenuItem(
                                  onClick: () {
                                    cubit.deleteProduct(products[index].productId);
                                    Navigator.pop(context);
                                  }, child: const Text('Delete')),
                            ],
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image(
                                image:
                                    AssetImage(products[index].productLocation),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Opacity(
                                opacity: .8,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          products[index].productName,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          '${products[index].productPrice}'
                                          ' \$',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: products.length,
                  );
                } else {
                  return const Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
          );
        });
  }
}

