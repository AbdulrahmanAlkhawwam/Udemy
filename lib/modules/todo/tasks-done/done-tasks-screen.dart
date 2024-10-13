import 'package:udemy/shared/components/components.dart';
import 'package:udemy/layout/todo/cubit/states.dart';
import 'package:udemy/layout/todo/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class doneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<todoAppCubit,todoAppStates>(
      listener: (context,state) {},
      builder:(context,state) =>
      todoAppCubit.get(context).doneTasks.length > 0 ?
      ListView.separated(
        itemBuilder: (context,index) =>
            buildDTI(
              index: index,
              context: context,
              time: todoAppCubit.get(context).doneTasks[index]['time'],
              title: todoAppCubit.get(context).doneTasks[index]['title'],
              date: todoAppCubit.get(context).doneTasks[index]['date'],
            ),
        separatorBuilder: (context,index) => divider(),
        itemCount: todoAppCubit.get(context).doneTasks.length,
      )
          :
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.menu,color:  Colors.grey,size: 100.0,),
            Text('No Tasks Yet , please add new Tasks',
              style: TextStyle(
                  color:  Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800
              ),)
          ],
        ),
      ),
    );
  }
}
