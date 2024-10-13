import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/models/shop/login_model.dart';
import 'package:udemy/modules/shop/login/cubit/states.dart';
import 'package:udemy/shared/network/remote/dio-helper.dart';
import '../../../../shared/network/end_points.dart';

class shopLoginCubit extends Cubit<ShopLoginStates> {

  shopLoginCubit() : super (shopLoginInitialState());

  static shopLoginCubit get(context) => BlocProvider.of(context);

  Icon passwordIcon = Icon(Icons.visibility);
  bool isPasswordShow = true ;

  void changePasswordVisibility (){
    passwordIcon =isPasswordShow ? Icon(Icons.visibility) :Icon(Icons.visibility_off);
    isPasswordShow = !isPasswordShow;
    emit(shopChangePasswordState());
  }
  void userLogin ({
    required String email,
    required String password,
}){
    emit(shopLoginLoadingState());
    DioHelper.PostData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
          },
    ).then((value) {
      shopLoginModel loginModel = shopLoginModel.fromJson(value.data);
      emit(shopLoginSuccessState(loginModel));
    }).catchError((error){
      print (error.toString());
      emit(shopLoginErrorState(error.toString()));
    });
  }
}