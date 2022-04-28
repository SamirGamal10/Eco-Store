// // ignore_for_file: unused_local_variable
//
// import 'package:e_commerce/layout/homepage.dart';
// import 'package:e_commerce/shared/cubit/cubit.dart';
// import 'package:e_commerce/shared/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ConnectUs extends StatelessWidget {
//   const ConnectUs({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopAppCubit, ShopAppStates>(
//         listener: (BuildContext context, Object? state) {},
//         builder: (BuildContext context, state) {
//           var cubit = ShopAppCubit.get(context);
//           Scaffold(
//             key: _scaffoldKey,
//             appBar: AppBar(
//               elevation: 0.0,
//               backgroundColor: Color(0xfff8f8f8),
//               title: IconButton(
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Color(0xff746bc9),
//                   size: 35,
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (ctx) => HomePage()));
//                 },
//               ),
//             ),
//             body: Container(
//               padding: EdgeInsets.symmetric(horizontal: 27),
//               height: 600,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Text(
//                     "Sent Us Your Message",
//                     style: TextStyle(
//                       color: Color(0xff746bc9),
//                       fontSize: 28,
//                     ),
//                   ),
//                   _buildSingleFlied(name: name),
//                   _buildSingleFlied(name: email),
//                   Container(
//                     height: 200,
//                     child: TextFormField(
//                       controller: message,
//                       expands: true,
//                       maxLines: null,
//                       textAlignVertical: TextAlignVertical.top,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: " Message",
//                       ),
//                     ),
//                   ),
//                   MyButton(
//                     name: "Submit",
//                     onPressed: () {
//                       vaildation();
//                     },
//                   )
//                 ],
//               ),
//             ),
//           )
//
//
//         });
//   }
// }
