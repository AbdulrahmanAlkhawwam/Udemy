import 'package:udemy/models/shop/login_model.dart';

abstract class ShopLoginStates {}

class shopLoginInitialState extends ShopLoginStates {}

class shopLoginLoadingState extends ShopLoginStates {}

class shopLoginSuccessState extends ShopLoginStates {
  final shopLoginModel loginModel ;
  shopLoginSuccessState(this.loginModel);
}

class shopLoginErrorState extends ShopLoginStates {
  final String error ; 
  shopLoginErrorState(this.error);
}

class shopChangePasswordState extends ShopLoginStates {}