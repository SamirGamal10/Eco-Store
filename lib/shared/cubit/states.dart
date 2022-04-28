abstract class ShopAppStates {}

class RegisterChangeIconStates extends ShopAppStates {}

class ShopAppInitial extends ShopAppStates {}

class ShopAppNavBar extends ShopAppStates {}
class ShopTabBar extends ShopAppStates {}
class ShopChangeIsAdmin extends ShopAppStates {}
class ShopChangeIsLoading extends ShopAppStates {}
class ShopAppCubitNavBar extends ShopAppStates {}

class ShopAppChangeIconStates extends ShopAppStates {}

class LoginChangeIconStates extends ShopAppStates {}

class LoginSuccessStates extends ShopAppStates {
  final String uid;

  LoginSuccessStates(this.uid);
}
class ShopAdminCreateSuccess extends ShopAppStates {}
class ShopAdminCreateError extends ShopAppStates {
  final String error;

  ShopAdminCreateError(this.error);
}

class LoginErrorStates extends ShopAppStates {
  final String error;
  LoginErrorStates(this.error);
}
class ShopUserCreateSuccess extends ShopAppStates {}

class ShopUserCreateError extends ShopAppStates {
  final String error;

  ShopUserCreateError(this.error);
}

class RegisterSuccessStates extends ShopAppStates {
  final String uid;

  RegisterSuccessStates(this.uid);
}

class RegisterErrorStates extends ShopAppStates {
  final String error;

  RegisterErrorStates(this.error);
}

class ShopGetUserSuccess extends ShopAppStates {}

class ShopGetUserError extends ShopAppStates {
  final String error;
  ShopGetUserError(this.error);
}
class ShopGetAdminSuccess extends ShopAppStates {}
class ShopGetAdminError extends ShopAppStates {
  final  String error;

  ShopGetAdminError(this.error);

}
class Shopbottomnavbar extends ShopAppStates {}

class Shopchangemode extends ShopAppStates {}
class Shopchangemodeerror extends ShopAppStates {
  final String error;

  Shopchangemodeerror(this.error);
}
class ShopprofileImage extends ShopAppStates {}
class ShopprofileImageError extends ShopAppStates {

}
class ShopcoverImage extends ShopAppStates {}
class ShopcoverImageError extends ShopAppStates {

}
class ShopUpdateUserLoading extends ShopAppStates {}
class Shopupdateuser extends ShopAppStates {}
class Shopupdateusererror extends ShopAppStates {
  final String error;

  Shopupdateusererror(this.error);
}
class ShoprUpdateLoadingState extends ShopAppStates{}
class ShopuploadProfileImage extends ShopAppStates {}
class ShopuploadProfileImageerror extends ShopAppStates {
  final String error;

  ShopuploadProfileImageerror(this.error);


}
class ShopuploadCoverLoadingImage extends ShopAppStates {}
class ShopuploadCoverImage extends ShopAppStates {}
class ShopuploadCoverImageerror extends ShopAppStates {
  final String error;

  ShopuploadCoverImageerror(this.error);




}
class ShopDeleteProductSuccess extends ShopAppStates {}
class ShopDeleteProductError extends ShopAppStates {
  final String error;

  ShopDeleteProductError(this.error);
}
class ShopEditProductSuccess extends  ShopAppStates {}
class ShopEditProductError extends ShopAppStates {
  final String error;

  ShopEditProductError(this.error);
}