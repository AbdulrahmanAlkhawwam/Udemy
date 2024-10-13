import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/counter/cubit/cubit.dart';
import 'package:udemy/layout/counter/cubit/states.dart';

class counterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterCubit() ,
      child: BlocConsumer < counterCubit , counterStates > (
        listener: (context,state){},
        builder: (context,state)=> Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 120.0, horizontal: 30),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        if (counterCubit.get(context).counter > 0) {
                          /* setState(() {});*/
                          counterCubit.get(context).minus();
                        }
                      },
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${counterCubit.get(context).counter}',
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        /* setState(() {});*/
                        counterCubit.get(context).plus();
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.grey,
                ),
                child: IconButton(
                    onPressed: () {
                      /*setState(() {});*/
                      counterCubit.get(context).reset();
                    },
                    icon: Icon(Icons.restart_alt,
                      color: Colors.white,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


