// ignore_for_file: unused_local_variable
import 'package:e_commerce/models/shopmodel.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Product? products =
              ModalRoute.of(context)!.settings.arguments as Product?;
          var cubit = ShopAppCubit.get(context);

          return Scaffold(
              body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('${products?.productLocation}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, CartScreen.id);
                          },
                          child: const Icon(Icons.shopping_cart))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  children: <Widget>[
                    Opacity(
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .3,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${products?.productName}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${products?.productDescription}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${products?.productPrice}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipOval(
                                    child: Material(
                                      color: Colors.white,
                                      child: GestureDetector(
                                        // onTap: add,
                                        child: const SizedBox(
                                          child: Icon(Icons.add),
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text(
                                  //   _quantity.toString(),
                                  //   style: TextStyle(fontSize: 60),
                                  // ),
                                  ClipOval(
                                    child: Material(
                                      color: Colors.white,
                                      child: GestureDetector(
                                        // onTap: subtract,
                                        child: const SizedBox(
                                          child: Icon(Icons.remove),
                                          height: 32,
                                          width: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      opacity: .5,
                    ),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .08,
                      child: Builder(
                        builder: (context) => RaisedButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                          color: Colors.white,
                          onPressed: () {
                            // addToCart(context, product);
                          },
                          child: Text(
                            'Add to Cart'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
        });
  }
}
