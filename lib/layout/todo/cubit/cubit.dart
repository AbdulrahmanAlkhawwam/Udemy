import 'package:udemy/modules/todo/tasks-archived/archived-tasks-screen.dart';
import 'package:udemy/modules/todo/tasks-done/done-tasks-screen.dart';
import 'package:udemy/modules/todo/tasks-new/new-tasks-screen.dart';
import 'package:udemy/layout/todo/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class todoAppCubit extends Cubit <todoAppStates> {
  todoAppCubit() : super (initialState());

  static todoAppCubit get(context) => BlocProvider.of(context) ;

  Icon floatIcon = Icon(Icons.edit);
  List <Widget> Screens = [
    newTasksScreen(),
    doneTasksScreen(),
    archivedTasksScreen(),
  ] ;
  late Database database ;
  List <Map> newTasks = [] ;
  List <Map> doneTasks = [] ;
  List <Map> archiveTasks = [] ;
  int currentIndex = 0 ;
  bool isShow = false ;

  void changeBNBIndex (int index){
    currentIndex = index ;
    emit(changeBNBState());
  }

  void changeBSIState ({required bool isShow,required Icon icon,}){
    this.isShow = isShow ;
    floatIcon = icon ;
    emit(changeBSState());
  }

  void createDatabase () {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database,version)  {
        database.execute('CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)').
        then((value) => print('table created')).
        catchError((error){print('Error when table created ${error.toString()}');});
        print ('database created');
      },
      onOpen: (database){
        getDataFromDatabase(database);
        print ('database opened');
      },
    ).then((value) {
      database = value ;
      emit(createDatabaseState());
    });
  }

  void getDataFromDatabase (database)  {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(getDataFromDatebaseInLoadingState());
    database.rawQuery('SELECT * FROM task').
    then((value) {
      value.forEach((element) {
        if(element['status'] == "new" ){
          newTasks.add(element);
        }
        else if (element['status'] == "done"){
          doneTasks.add(element);
        }
        else {
          archiveTasks.add(element);
        }
      });
      emit(getDataFromDatebaseState());
    });
  }

  void deleteDatabase ({required int id }) async {
    database.rawDelete('DELETE FROM task WHERE id = ?', [id])
        .then((value) {
      getDataFromDatabase(database);
      emit(deleteDataBaseState());
    })
        .catchError((error){print('Error when record deleted ${error.toString()}');
    });
  }

  void updateDatabase ({required String status,required int id}) async {
    database.rawUpdate(
        'UPDATE task SET status = ? WHERE id = ?',
        ["$status", id])
        .then((value) {
          getDataFromDatabase(database);
          emit(updateDataBaseState());
        }).catchError((error){print('Error when record updated ${error.toString()}');
    });
  }

  void insertDataInDatabase ({required String title, required String time, required String date}) {
    database.transaction((txn) => txn.rawInsert('INSERT INTO task (title,time,date,status) VALUES("$title","$time","$date","new")').
    then((value) {
      print('$value inserted successfully');
      emit(inserteDatabaseState());
      getDataFromDatabase(database);
    }).
    catchError((error){print('Error when insert new record ${error.toString()}');}));
  }

}