import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/Network/local.dart';
import 'package:untitled/Network/remote/diohelper.dart';
import 'package:untitled/cubit/cubit/cubit.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/modules/layout/news_layout.dart';
import 'package:untitled/modules/screens/search/search_screen.dart';

import 'shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getbusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var Cubit = NewsCubit.get(context);
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  actionsIconTheme: IconThemeData(color: Colors.black,size: 30.0),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                      ,fontSize: 20.0),
                  elevation: 5.0,

                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Colors.black,
                    )
                )
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: HexColor('333739'),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  actionsIconTheme: IconThemeData(color: Colors.white,size: 30.0),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                      ,fontSize: 20.0),
                  elevation: 5.0,

                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    )
                )
            ),
           themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
           home:NewsLayout(),
          );
        },
      ),
    );
  }
}

