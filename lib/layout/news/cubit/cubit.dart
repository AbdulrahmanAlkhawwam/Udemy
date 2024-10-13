import 'package:udemy/modules/news/news-technology/technology-news-screen.dart';
import 'package:udemy/modules/news/news-business/business-news-screen.dart';
import 'package:udemy/modules/news/news-science/Science-news-screen.dart';
import 'package:udemy/modules/news/news-sport/sport-news-screen.dart';
import 'package:udemy/shared/network/local/cache-helper.dart';
import 'package:udemy/shared/network/remote/dio-helper.dart';
import 'package:udemy/layout/news/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class newsAppCubit extends Cubit<newsAppStates> {
  // contractor
  newsAppCubit() : super(initialState());
  static newsAppCubit get(context) => BlocProvider.of(context);

  // variable
  int currentIndex = 0;
  int themeModeColor = 0;
  List<BottomNavigationBarItem> BNBI = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_motorsports),
      label: 'sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.phonelink),
      label: 'technology',
    ),
  ];
  List<Widget> Screens = [
    businessNewsScreen(),
    sportNewsScreen(),
    scienceNewsScreen(),
    technologyNewsScreen(),
  ];
  List<String> titles = [
    'Business News',
    'Sport News',
    'Science News',
    'Technology News',
  ];
  List technology = [];
  List business = [];
  List science = [];
  List search = [];
  List sport = [];
  bool isDark = false;

  // methods
  void changeNBS(int index) {
    currentIndex = index;
    if (index == 1) getSport();
    if (index == 2) getScience();
    if (index == 3) getTechnology();
    emit(NBNBState());
  } // change Navigator Bar State

  void changeTS({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark)
        .then((value) => emit(CTState()));
  } // change Theme State

  void getBusiness() {
    emit(NGBLState());
    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '20fb7b2d013046679b6d0652e5a18810',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(NGBSState());
      }).catchError((error) {
        print(error.toString());

        emit(NGBEState(error.toString()));
      });
    } else {
      emit(NGBSState());
    }
  } // get Business

  void getSport() {
    emit(NGSpLState());
    if (sport.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '20fb7b2d013046679b6d0652e5a18810',
        },
      ).then((value) {
        sport = value.data['articles'];
        emit(NGSpSState());
      }).catchError((error) {
        print(error.toString());

        emit(NGSpEState(error.toString()));
      });
    } else {
      emit(NGSpSState());
    }
  } //get Sport

  void getScience() {
    emit(NGScLState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '20fb7b2d013046679b6d0652e5a18810',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NGScSState());
      }).catchError((error) {
        print(error.toString());

        emit(NGScEState(error.toString()));
      });
    } else {
      emit(NGScSState());
    }
  } // get Science

  void getTechnology() {
    emit(NGTLState());
    if (technology.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'technology',
          'apiKey': '20fb7b2d013046679b6d0652e5a18810',
        },
      ).then((value) {
        technology = value.data['articles'];
        emit(NGTSState());
      }).catchError((error) {
        print(error.toString());

        emit(NGTEState(error.toString()));
      });
    } else {
      emit(NGTSState());
    }
  } // get Technology

  void getSearch(String value) {
    emit(NGSeLState());
    DioHelper.getData(
      url: '/v2/everything',
      query: {
        'q': value,
        'apiKey': '20fb7b2d013046679b6d0652e5a18810',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NGSeSState());
    }).catchError((error) {
      print(error.toString());
      emit(NGSeEState(error.toString()));
    });
    emit(NGSeSState());
  } // get search
}
