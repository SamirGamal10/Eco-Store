// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:e_commerce/models/shopmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultTextFromField({
  TextEditingController? controller,
  required TextInputType type,
  FormFieldValidator? validator,
  required String labelText,
  Widget? prefixIcon,
  IconData? suffixIcon,
  GestureTapCallback? ontap,
  ValueChanged? onChanged,
  ValueChanged? onSubmitted,
  bool ispassword = false,
  VoidCallback? onPressedSuffix,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: ontap,

      decoration: InputDecoration(

        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          onPressed: onPressedSuffix,
          icon: Icon(suffixIcon),
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget bottom({
  double width = double.infinity,
   BorderRadiusGeometry? borderRadius,
   Color? color,
  required VoidCallback function,
   String? text,
  double? fontSize,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );



Widget defaultTextButton({
  required Function function,
  required String text,
  Color? color,
}) =>
    TextButton(

      onPressed: function(),
      child: Text(text.toUpperCase(),style: TextStyle(
        fontSize: 18,
        color:color,
      ),

      ),
    );

void navgateTo(context, Widget, {Object? arguments}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void navgateAndFinsh(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Widget),
      (Route<dynamic> route) => false,
    );

Widget mydrive() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.black,
    );

void showToast({
  required String text,
  required Toaststate state,
  required int time,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: time,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum Toaststate { success, error, warning }
Color chooseToastColor(Toaststate state) {
  Color color;
  switch (state) {
    case Toaststate.success:
      color = Colors.green;
      break;
    case Toaststate.error:
      color = Colors.red;
      break;
    case Toaststate.warning:
      color = Colors.black;
      break;
  }
  return color;
}

Widget mycard({
  required String text,
  required String salary,
  required String image,
}) =>
    Card(
      child: Container(
        color: HexColor('#F8F9F6'),
        height: 190,
        width: 150,
        child: Column(
          children: [
            Container(
              height: 135,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        image,
                      ))),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text(
                  salary,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget mycategorie({
  required String image,
}) =>
    Container(
      height: 150,
      width: 130,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Image(
          image: AssetImage(
            image,
          ),
          // fit: BoxFit.fill
        ),
      ),
      // backgroundColor: Colors.white,
      // maxRadius: 60,
      // backgroundImage: AssetImage(image,) ,
    );


