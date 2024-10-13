import 'package:flutter/material.dart';
import 'package:udemy/shared/components/components.dart';

class loginScreen extends StatefulWidget {

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  bool eye = true ;
  var Formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (),
      body:  Padding(
        padding:  EdgeInsets.all(20.0),
        child: Center (
          child: SingleChildScrollView (
            child: Form (
              key: Formkey,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text (
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ) ,
                  SizedBox (
                    height: 40.0,
                  ) ,
                  textFF(
                    onChanged: (value) {
                      print (value);
                    } ,
                    onSubmitted: (value) {
                      print (value);
                    } ,
                    labelText: 'Email Address' ,
                    prefixIcon: IconButton (onPressed: (){}, icon: Icon(Icons.email)) ,
                    controller: emailController ,
                    keyboardType: TextInputType.emailAddress ,
                    validate:'email address must not be empty' ,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  textFF(
                    obscure: eye,
                    onChanged: (value) {print (value);} ,
                    onSubmitted: (value) {print (value);} ,
                    labelText: 'Password' ,
                    prefixIcon: IconButton (onPressed: (){}, icon: Icon(
                      Icons.lock,
                    )) ,
                    suffixIcon: IconButton (
                        onPressed: () {
                          setState(() {});
                          eye =! eye;
                        },
                        icon: eye ? Icon(Icons.visibility,) : Icon(Icons.visibility_off,) ,
                    ) ,
                    controller: passwordController ,
                    keyboardType: TextInputType.visiblePassword ,
                    validate: 'password must not be empty' ,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  bottom(text: 'LOGIN' , onPressed: () {
                      if (Formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    } , ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () => print ('register now'),
                        child: const Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
