import 'package:udemy/shared/components/components.dart';
import 'package:udemy/layout/todo/cubit/states.dart';
import 'package:udemy/layout/todo/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class todoHomeScreen extends StatelessWidget {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  var Formkey = GlobalKey<FormState>();

  todoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => todoAppCubit()..createDatabase(),
      child: BlocConsumer<todoAppCubit, todoAppStates>(
        listener: (context, state) {
          if (state is inserteDatabaseState) {
            Navigator.pop(context);
          }
          titleController.text = '';
          timeController.text = '';
          dateController.text = '';
        },
        builder: (context, state) => Scaffold(
          key: Scaffoldkey,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: Text(
              'TODO app',
            ),
            elevation: 5.0,
          ),
          body: state is! getDataFromDatebaseInLoadingState
              ? todoAppCubit
                  .get(context)
                  .Screens[todoAppCubit.get(context).currentIndex]
              : Center(child: CircularProgressIndicator()),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: todoAppCubit.get(context).currentIndex,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blue[100],
            onTap: (index) {
              todoAppCubit.get(context).changeBNBIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_sharp), label: 'Done'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined), label: 'Archived'),
            ],
            elevation: 5.0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
                if (todoAppCubit.get(context).isShow) {
                  if (Formkey.currentState!.validate()) {
                    todoAppCubit.get(context).insertDataInDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                    todoAppCubit
                        .get(context)
                        .changeBSIState(isShow: false, icon: Icon(Icons.edit));
                  }
                } else {
                  Scaffoldkey.currentState
                      ?.showBottomSheet(
                          (context) => Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: Formkey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      textFF(
                                        controller: titleController,
                                        labelText: 'Task Title',
                                        validate:
                                            'The Task title must not be empty',
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.title),
                                          onPressed: () {},
                                        ),
                                        maxLength: 15,
                                        keyboardType: TextInputType.text,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      textFF(
                                        controller: timeController,
                                        labelText: 'Task Time',
                                        validate:
                                            'The Task time must not be empty',
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.watch_later_outlined),
                                          onPressed: () {},
                                        ),
                                        keyboardType: TextInputType.datetime,
                                        onTap: () {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then((value) => timeController.text =
                                              value!.format(context));
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      textFF(
                                          controller: dateController,
                                          labelText: 'Task Date',
                                          validate:
                                              'The Task date must not be empty',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                Icons.calendar_month_outlined),
                                            onPressed: () {},
                                          ),
                                          keyboardType: TextInputType.datetime,
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.parse(
                                                        '2029-12-31'))
                                                .then((value) =>
                                                    dateController.text =
                                                        DateFormat.yMd()
                                                            .format(value!));
                                          })
                                    ],
                                  ),
                                ),
                              ),
                          elevation: 0.0)
                      .closed
                      .then((value) {
                    todoAppCubit
                        .get(context)
                        .changeBSIState(isShow: false, icon: Icon(Icons.edit));
                  });
                  todoAppCubit
                      .get(context)
                      .changeBSIState(isShow: true, icon: Icon(Icons.add));
                }
            },
            child: todoAppCubit.get(context).floatIcon,
          ),
        ),
      ),
    );
  }
}
