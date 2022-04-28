// ignore_for_file: must_be_immutable, sized_box_for_whitespace, import_of_legacy_library_into_null_safe, unused_local_variable
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {


  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = ShopAppCubit.get(context);


        return Stack(
          children: [
            DefaultTabController(
                length: 4,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    bottom: TabBar(
                      onTap: (index) {
                        cubit.changeTabBar(cubit.tabBar);
                      },
                      labelColor: Colors.black,
                      indicatorColor: Colors.red,
                      tabs: const [
                        Text('Jackets',
                            style: TextStyle(
                                fontSize:
                                    18)),
                        Text('Trouser',
                            style: TextStyle(
                                fontSize:
                                    18)),
                        Text('T-shirts',
                            style: TextStyle(
                               fontSize:
                                    18)),
                        Text('Shoes',
                            style: TextStyle(
                              fontSize:
                            18)),
                      ],
                    ),
                  ),
                  body:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(
                      children: [
                       cubit. jacketView(),
                    cubit.trouserView(),
                        cubit.tShirtView(),
                        cubit.shoesView(),
                      ],
                    ),
                  ),
                )),
            Material(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * .12,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Discover'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, CartScreen.id);
                          },
                          child:  const Icon(Icons.shopping_cart_outlined))
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );


  }

  List<String> salary = ["30.00 \$", "30.00 \$", "100.00 \$"];
  List<String> text = ["man T Shirt", "watch classic", "women T Shirt"];
  List<String> image = [
    "assets/images/women.jpg",
    "assets/images/man.jpg",
    "assets/images/watch.jpg"
  ];



}

// Map<String,dynamic> featured = {
//   "salary":[
//     {
//       "salary":"20",
//       "text":"man T Shirt",
//       "image":"assets/images/women.jpg",
//     },
//     {
//       "salary":"10",
//       "text":"watch classic",
//       "image":"assets/images/man.jpg",
//     },
//     {
//       "salary":"32",
//       "text":"women T Shirt",
//       "image":"assets/images/watch.jpg",
//     },
//   ],
// };
// return Scaffold(
// // key: cubit.scafKey,
// appBar: AppBar(
// leading: IconButton(
// icon: const Icon(IconBroken.Notification),
// color: Colors.black,
// onPressed: () {},
// ),
// title: Center(
// child: Text(
// 'eco store',
// style: GoogleFonts.amiri(
// color: Colors.redAccent,
// fontSize: 32,
// fontStyle: FontStyle.italic,
// ),
// )),
// actions: [
// IconButton(
// icon: const Icon(IconBroken.Search),
// color: Colors.black,
// onPressed: () {},
// ),
// const SizedBox(
// width: 10,
// ),
// ],
// ),
// body: Padding(
// padding: const EdgeInsets.all(15.0),
// child: Column(
// children: [
// Container(
// height: 200,
// child: CarouselSlider(
// items: const [
// Image(
// image: AssetImage(
// "assets/images/sales.png",
// ),
// ),
// Image(image: AssetImage("assets/images/mobile.jpeg")),
// Image(
// image: AssetImage("assets/images/elecgroub.jpeg")),
// Image(image: AssetImage("assets/images/watch.jpg")),
// Image(image: AssetImage("assets/images/tman.jpg")),
// ],
// options: CarouselOptions(
// height: 200,
// initialPage: 0,
// viewportFraction: 1,
// enableInfiniteScroll: true,
// reverse: false,
// autoPlay: true,
// autoPlayInterval: const Duration(seconds: 3),
// autoPlayAnimationDuration: const Duration(seconds: 1),
// autoPlayCurve: Curves.fastOutSlowIn,
// scrollDirection: Axis.horizontal,
// ),
// ),
// ),
// Container(
// width: double.infinity,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Row(
// children: const [
// Text(
// "Featuerd",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// Spacer(),
// Text("see all",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// )),
// ],
// )
// ],
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Expanded(
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, index) {
// return mycard(
// salary: salary[index],
// text: text[index],
// image: image[index],
// );
// },
// itemCount: 3,
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// Row(
// children: const [
// Text(
// "Categorie",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// Spacer(),
// Text(
// "See all",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// const SizedBox(
// height: 10,
// ),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Container(
// height: 120,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// mycategorie(image: "assets/images/address.jpg"),
// mycategorie(image: "assets/images/pant.png"),
// mycategorie(image: "assets/images/shirt.jpg"),
// mycategorie(image: "assets/images/shoes.jpg"),
// mycategorie(image: "assets/images/tie.jpeg"),
// ],
// ),
// ),
// ),
// ],
// ),
// ));



