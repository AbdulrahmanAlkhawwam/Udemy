import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/layout/counter/cubit/states.dart';
/*
* the logic line is in cubit file
*/
class counterCubit extends Cubit <counterStates>
{
  counterCubit() : super(initialState());

  static counterCubit get(context) {return BlocProvider.of(context);}

  int counter = 0 ;

  void plus () {
    counter ++ ;
    emit(plusState());
  }
  void minus () {
    counter -- ;
    emit(minusState());
  }
  void reset () {
    counter = 0 ;
    emit(resetState());
  }

}