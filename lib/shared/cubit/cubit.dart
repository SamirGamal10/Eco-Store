import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/layout/mybag.dart';
import 'package:e_commerce/layout/homepage.dart';
import 'package:e_commerce/layout/category.dart';
import 'package:e_commerce/layout/productinfo.dart';
import 'package:e_commerce/layout/setting.dart';
import 'package:e_commerce/models/shopmodel.dart';
import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/components/constants.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/network/local/cach_helper.dart';
import 'package:e_commerce/shared/styles/iconbroken.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(ShopAppInitial());

  static ShopAppCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final userName = TextEditingController();
  final phone = TextEditingController();
  final registerkey = GlobalKey<FormState>();
  final loginkey = GlobalKey<FormState>();
  final productKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productCategoryController = TextEditingController();
  final productLocationController = TextEditingController();

  // var scafKey = GlobalKey<ScaffoldState>();//drwar

  bool isDark = false;

  void changeMode({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      emit(Shopchangemode());
    } else {
      isDark = !isDark;
      CachHelper.putbool(key: 'isDark', value: isDark).then((value) {
        emit(Shopchangemode());
      });
    }
  }

  var currentindex = 0;

  void changeNavBar(int index) {
    currentindex = index;
    emit(Shopbottomnavbar());
  }

  var tabBar = 0;
  void changeTabBar(index) {
    tabBar = index;
    tabBar += tabBar;

    emit(ShopTabBar());
  }

  bool isAdmin = false;
  void changeIsAdmin(bool value) {
    isAdmin = value;
    emit(ShopChangeIsAdmin());
  }

  bool isLoading = false;
  void changeIsLoading(bool value) {
    isLoading = value;
    emit(ShopChangeIsLoading());
  }

  List<BottomNavigationBarItem> botNavBar = const [
    BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Category), label: 'Category'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Bag), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Setting), label: 'Setting'),
  ];
  List<Widget> screen = [
    HomePage(),
    const Category(),
    const Bag(),
    const Setting(),
  ];
  bool isPassword = true;

  void changIconPassword() {
    isPassword = !isPassword;
    emit(LoginChangeIconStates());
  }
  Widget jacketView() {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products=[] ;
            for (var doc in snapshot.data!.docs) {
              // var data = doc.data;

              if(doc['productCategory']=='jacket')
              {
                products.add(Product(
                  productId: doc.id,
                  productName: doc['productName'],
                  productCategory: doc['productCategory'],
                  productDescription: doc['productDescription'],
                  productLocation: doc['productLocation'],
                  productPrice: doc['productPrice'],
                ));
              }
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: (){
                    navgateTo(context,const ProductInfo(),arguments: products[index]);


                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: AssetImage(products[index].productLocation),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
  }
  Widget trouserView() {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              // var data = doc.data;

              if(doc['productCategory']=='trouser')
              {
                products.add(Product(
                  productId: doc.id,
                  productName: doc['productName'],
                  productCategory: doc['productCategory'],
                  productDescription: doc['productDescription'],
                  productLocation: doc['productLocation'],
                  productPrice: doc['productPrice'],
                ));
              }
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: AssetImage(products[index].productLocation),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
  }
  Widget tShirtView() {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              // var data = doc.data;

              if(doc['productCategory']=='t-shirt')
              {
                products.add(Product(
                  productId: doc.id,
                  productName: doc['productName'],
                  productCategory: doc['productCategory'],
                  productDescription: doc['productDescription'],
                  productLocation: doc['productLocation'],
                  productPrice: doc['productPrice'],
                ));
              }
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: AssetImage(products[index].productLocation),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
  }
  Widget shoesView() {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              // var data = doc.data;

              if(doc['productCategory']=='shoes')
              {
                products.add(Product(
                  productId: doc.id,
                  productName: doc['productName'],
                  productCategory: doc['productCategory'],
                  productDescription: doc['productDescription'],
                  productLocation: doc['productLocation'],
                  productPrice: doc['productPrice'],
                ));
              }
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: AssetImage(products[index].productLocation),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
  }


  void userLogin({
    required String emailAddress,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessStates(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorStates(error.toString()));
    });
  }

  void userRegister({
    required String userName,
    required String emailAddress,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) {
      userCreate(
        uid: value.user!.uid,
        userName: userName,
        emailAddress: emailAddress,
        phone: phone,
      );
      emit(RegisterSuccessStates(value.user!.uid));
    }).catchError((error) {
      emit(RegisterErrorStates(error.toString()));
    });
  }

  void userCreate({
    required String userName,
    required String emailAddress,
    required String phone,
    required String uid,
  }) {
    ShopUserModels model = ShopUserModels(
      emailAddress: emailAddress,
      userName: userName,
      phone: phone,
      uid: uid,
      location: 'Write your Location',
      image:
          'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1650031738~exp=1650032338~hmac=2794ee5a69ec845814d229188d92d6bcd396728e45cf4b96763673d59cafb773&w=740',
      cover:
          'https://img.freepik.com/free-photo/smiling-adult-man-waiting-surprise-covering-eyes-with-hands-anticipating-standing-against-blue-background-casual-clothes_1258-73719.jpg?t=st=1650055269~exp=1650055869~hmac=fb8f942508a33e8f748bc4a76834e6ba0edd1a56d3e3607bb38cfcc1804941ff&w=1060',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(ShopUserCreateSuccess());
    }).catchError((error) {
      emit(ShopUserCreateError(error.toString()));
    });
  }

  void adminCreate({
    required String productName,
    required String productPrice,
    required String productLocation,
    required String productDescription,
    required String productCategory,
    String? productId,
  }) {
    Product model = Product(
      productLocation: productLocation,
      productCategory: productCategory,
      productName: productName,
      productPrice: productPrice,
      productDescription: productDescription,
      productId: productId ?? "",
    );
    FirebaseFirestore.instance
        .collection('Product')
        .doc(productId)
        .set(model.toMap())
        .then((value) {
      emit(ShopAdminCreateSuccess());
    }).catchError((error) {
      emit(ShopAdminCreateError(error.toString()));
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return FirebaseFirestore.instance.collection('Product').snapshots();
  }

  deleteProduct(productId) {
    FirebaseFirestore.instance
        .collection('Product')
        .doc(productId)
        .delete()
        .then((value) {
      emit(ShopDeleteProductSuccess());
    }).catchError((error) {
      emit(ShopDeleteProductError(error.toString()));
    });
  }

  editProduct(data, productId) {
    FirebaseFirestore.instance
        .collection('Product')
        .doc(productId)
        .update(data)
        .then((value) {
      emit(ShopEditProductSuccess());
    }).catchError((error) {
      emit(ShopEditProductError(error.toString()));
    });
  }

  ShopUserModels? userModel;

  void getUserData() {
    FirebaseFirestore.instance.collection('Users').doc(uid).get().then((value) {
      userModel = ShopUserModels.fromJson(value.data()!);
      emit(ShopGetUserSuccess());
    }).catchError((error) {
      emit(ShopGetUserError(error.toString()));
    });
  }

  // Future getUserData() async {
  //   try {
  //     final value =
  //         await FirebaseFirestore.instance.collection('Users').doc(uid).get();
  //     log(value.toString());
  //     userModel = ShopUserModels.Fromjson(value.data()!);
  //
  //     emit(GetUserSuccessStates());
  //   } catch (error, s) {
  //     log('error on get user data ', error: error, stackTrace: s);
  //     emit(GetUserErrorStates(error.toString()));
  //   }
  // }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ShopprofileImage());
    } else {
      emit(ShopprofileImageError());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(ShopcoverImage());
    } else {
      emit(ShopcoverImageError());
    }
  }

  // void editProduct({
  //   required String productName,
  //   required String productPrice,
  //   required String productLocation,
  //   required String productDescription,
  //   required String productCategory,
  //   String? productId,
  //
  // }) {
  //   Product model =Product(
  //      productName: productName,
  //       productPrice: productPrice,
  //       productLocation: productLocation,
  //       productDescription: productDescription,
  //       productCategory: productCategory,
  //       productId:productId?? "",
  //   );
  //
  //   FirebaseFirestore.instance
  //       .collection('Product')
  //       .doc()
  //       .update(model.toMap())
  //       .then((value) {
  //     emit(ShopEditProductSuccess());
  //   }).catchError((error) {
  //     emit(ShopEditProductError(error.toString()));
  //   });
  // }

  void updateUser({
    required String userName,
    required String phone,
    required String location,
    String? cover,
    String? image,
  }) {
    ShopUserModels model = ShopUserModels(
      userName: userName,
      phone: phone,
      location: location,
      emailAddress: userModel!.emailAddress,
      cover: cover ?? userModel!.cover,
      image: image ?? userModel!.image,
      uid: userModel!.uid,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(Shopupdateusererror(error.toString()));
    });
  }

  void uploadProfileImage({
    required String userName,
    required String phone,
    required String location,
  }) {
    emit(ShoprUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          userName: userName,
          location: location,
          image: value,
          phone: phone,
        );
      }).catchError((error) {
        emit(ShopuploadProfileImageerror(error.toString()));
      });
    }).catchError((error) {
      emit(ShopuploadProfileImageerror(error.toString()));
    });
  }

  void uploadCoverImage({
    required String userName,
    required String phone,
    required String location,
  }) {
    emit(ShopuploadCoverLoadingImage());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());
        updateUser(
          userName: userName,
          phone: phone,
          location: location,
          cover: value,
        );
      }).catchError((error) {
        emit(ShopuploadCoverImageerror(error.toString()));
      });
    }).catchError((error) {
      emit(ShopuploadCoverImageerror(error.toString()));
    });
  }


}


