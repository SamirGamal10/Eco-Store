// ignore_for_file: must_be_immutable

import 'package:e_commerce/shared/components/components.dart';
import 'package:e_commerce/shared/cubit/cubit.dart';
import 'package:e_commerce/shared/cubit/states.dart';
import 'package:e_commerce/shared/styles/iconbroken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {

   EditProfile({Key? key}) : super(key: key);
   var nameController = TextEditingController();
   var locationController = TextEditingController();
   var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: ( context,  state) {

        },
        builder: ( context, state) {
          var cubit = ShopAppCubit.get(context);
          var userModel = cubit.userModel;
          var profileImage = cubit.profileImage;
          var coverImage = cubit.coverImage;
          nameController.text = userModel!.userName;
          phoneController.text = userModel. phone;
          locationController.text = userModel.location;


          return Scaffold(
            appBar: AppBar(
              title:  Text('Edit Profile',style: GoogleFonts.lato(
                fontSize: 20,
                color:Colors.black54 ,
              ),),
              titleSpacing: 0.0,
              actions: [
                TextButton(
                  onPressed: (){
                  cubit.updateUser(
                      userName: nameController.text,
                      phone: phoneController.text,
                      location: locationController.text);
                },
                    child: Text(
                  'update'.toUpperCase(),
                      style: GoogleFonts.lato(
                        fontSize: 20,
                      ),
                )
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration:  BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                      4.0,
                                    ),
                                    topRight: Radius.circular(
                                      4.0,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null? NetworkImage(
                                      // 'https://img.freepik.com/free-photo/smiling-adult-man-waiting-surprise-covering-eyes-with-hands-anticipating-standing-against-blue-background-casual-clothes_1258-73719.jpg?t=st=1650055269~exp=1650055869~hmac=fb8f942508a33e8f748bc4a76834e6ba0edd1a56d3e3607bb38cfcc1804941ff&w=1060'
                                      userModel.cover,
                                    ):FileImage(coverImage) as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  cubit.getCoverImage();
                                },
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              child:   CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ?  NetworkImage(
                                  // 'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1650031738~exp=1650032338~hmac=2794ee5a69ec845814d229188d92d6bcd396728e45cf4b96763673d59cafb773&w=740'
                                  userModel.image,                                ): FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                              icon: const CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16.0,
                                ),
                              ),
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (cubit.profileImage != null ||
                      cubit.coverImage != null)
                    Row(
                      children: [
                        if (cubit.profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                bottom(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                  function: () {
                                    cubit.uploadProfileImage(
                                      userName: nameController.text,
                                      phone: phoneController.text,
                                      location: locationController.text,
                                    );
                                  },
                                  text: 'upload profile',
                                ),
                                if (state is ShopuploadProfileImage)
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is ShopuploadProfileImage)
                                  const LinearProgressIndicator(),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (cubit.coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                bottom (
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                  function: ()
                                  {
                                    cubit.uploadCoverImage(
                                      userName: nameController.text,
                                      phone: phoneController.text,
                                      location: locationController.text,
                                    );
                                  },
                                  text: 'upload cover',
                                ),
                                if (state is ShopUpdateUserLoading)
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is ShopUpdateUserLoading)
                                  const LinearProgressIndicator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  if (cubit.profileImage != null ||
                      cubit.coverImage != null)
                    const SizedBox(
                      height: 20.0,
                    ),
                  defaultTextFromField(
                      controller: nameController,
                      type: TextInputType.name,
                      labelText: userModel.userName,
                    prefixIcon: const Icon(IconBroken.User),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextFromField(
                    controller: locationController,
                    type: TextInputType.text,
                    labelText: '',
                    prefixIcon: const Icon(IconBroken.Location),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Location';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextFromField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    labelText: userModel.phone,
                    prefixIcon: const Icon(IconBroken.Call),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Phone';
                      }
                      return null;
                    },
                  ),

                ],
              ),
            ),
          ),
          );
        });
  }
}
