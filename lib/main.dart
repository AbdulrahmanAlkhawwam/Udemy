import 'package:udemy/modules/basics/bmi/bmi-screen.dart';
import 'package:udemy/modules/basics/counter/counter-screen.dart';
import 'package:udemy/modules/basics/home/home-screen.dart';
import 'package:udemy/modules/basics/home/news-home-screen.dart';
import 'package:udemy/modules/basics/login/login-screen.dart';
import 'package:udemy/modules/basics/messages/messages-screen.dart';
import 'package:udemy/modules/basics/user/user-screen.dart';
import 'package:udemy/modules/shop/onboarding/onboarding.dart';
import 'package:udemy/shared/network/local/cache-helper.dart';
import 'package:udemy/shared/network/remote/dio-helper.dart';
import 'package:udemy/layout/news/cubit/states.dart';
import 'package:udemy/layout/news/cubit/cubit.dart';
import 'modules/basics/home/todo-home-screen.dart';
import 'package:udemy/shared/Bloc_observer.dart';
import 'package:udemy/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

// Stateless
// Stateful

class MyApp extends StatelessWidget {
  late final bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
            create: (context) => newsAppCubit()
              ..getBusiness()
              ..changeTS(fromShared: isDark,),
          ),
        ],
      child:  BlocConsumer<newsAppCubit, newsAppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: shopLightTheme(),
          darkTheme: shopDarkTheme(),
          themeMode: newsAppCubit.get(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: onboardingScreen(),
          ),
        ),
      ),
    );
  }
}

/*
* url : baseurl / method ? query
* apikey (0d4b97992fda4695aacc8dec69ca4e19)
* apikey (20fb7b2d013046679b6d0652e5a18810)
////////////////////////////////////////////////////////////////////////////////
//          POST
//          UPDATE
//          DELETE
//          GET
////////////////////////////////////////////////////////////////////////////////
* baseurl : //newsapi.org/
* method (url) : v2/top-headlines?
* queries : country=eg&category=business&apikey=0d4b97992fda4695aacc8dec69ca4e19
  ////////////////    ////////////////    ////////////////    ////////////////
* baseurl : //newsapi.org/
* method (url) : v2/top-headlines?
* queries : country=us&category=business&apiKey=0d4b97992fda4695aacc8dec69ca4e19
////////////////////////////////////////////////////////////////////////////////
*/