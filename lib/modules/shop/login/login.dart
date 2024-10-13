import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy/modules/shop/login/cubit/cubit.dart';
import 'package:udemy/modules/shop/login/cubit/states.dart';
import 'package:udemy/modules/shop/register/register.dart';
import 'package:udemy/shared/components/components.dart';

class loginScreen extends StatelessWidget {
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => shopLoginCubit(),
      child: BlocConsumer<shopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is shopLoginSuccessState) {
            if (state.loginModel.status == true) {
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
            } else {
              print(state.loginModel.message);
              Fluttertoast.showToast(
                  msg: "${state.loginModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 10,
                  backgroundColor: Colors.red,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor("F8F8FA"),
              elevation: 0.0,
            ),
            backgroundColor: HexColor("F8F8FA"),
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Quicksand",
                            color: Color.fromRGBO(85, 205, 150, 1.0),
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Quicksand",
                            color: Colors.grey[500],
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        textFF(
                          controller: emailAddressController,
                          validate: 'Email Address must be not empty',
                          labelText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        textFF(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          labelText: 'password',
                          validate: 'Password must be not empty',
                          obscure: shopLoginCubit.get(context).isPasswordShow,
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              shopLoginCubit.get(context).userLogin(
                                  email: emailAddressController.text,
                                  password: passwordController.text);
                            }
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              shopLoginCubit
                                  .get(context)
                                  .changePasswordVisibility();
                            },
                            icon: shopLoginCubit.get(context).passwordIcon,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! shopLoginLoadingState,
                          builder: (context) {
                            return bottom(
                              text: 'LOGIN',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  shopLoginCubit.get(context).userLogin(
                                      email: emailAddressController.text,
                                      password: passwordController.text);
                                }
                              },
                              color: Color.fromRGBO(85, 205, 150, 1.0),
                            );
                          },
                          fallback: (context) {
                            return Center(child: CircularProgressIndicator(color: Color.fromRGBO(85, 205, 150, 1.0),));
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You don't have account ?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Quicksand",
                                color: Colors.grey[500],
                                fontSize: 15.0,
                              ),
                            ),
                            textBottom(
                                text: Text(
                                  'register'.toUpperCase(),
                                  style: TextStyle(
                                    color: Color.fromRGBO(85, 205, 150, 1.0),
                                  ),
                                ),
                                onPressed: () {
                                  navigateTo(context, registerScreen());
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
