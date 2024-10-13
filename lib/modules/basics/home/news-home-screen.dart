import 'package:udemy/layout/news/cubit/states.dart';
import 'package:udemy/layout/news/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class newsHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = newsAppCubit.get(context);
    return  BlocConsumer <newsAppCubit,newsAppStates> (
      listener: (context,state){},
      builder:(context,state)=>
          Scaffold(
              appBar: AppBar(
                title: Text(
                   cubit.titles[cubit.currentIndex],
                ),
                actions: [
                  IconButton(
                      onPressed: ()=> cubit.changeTS(),
                      icon: Icon(Icons.brightness_4_outlined),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex:cubit.currentIndex,
                onTap: (index)=> cubit.changeNBS(index),
                items:cubit.BNBI,
              ),
              body: cubit.Screens[cubit.currentIndex],
            ),
    );
  }
}