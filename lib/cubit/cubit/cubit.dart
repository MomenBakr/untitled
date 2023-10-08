import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/local.dart';
import 'package:untitled/Network/remote/diohelper.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/modules/screens/business/business_screen.dart';
import 'package:untitled/modules/screens/science/science_screen.dart';
import 'package:untitled/modules/screens/search/search_screen.dart';
import 'package:untitled/modules/screens/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int selectIndex =0;

  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
        label:'Business' ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label:'Sports' ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label:'Science' ),
  ];
  void ChangeBottomNav(index){
    selectIndex = index;
    if(index==1)
      {
        getSports();
      }
    if(index == 2)
      {
        getScience();
      }
    emit(NewsChangeBottomStates());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void ChangeScreenState(){
    emit(NewsChangeScreenState());
  }

  List <dynamic> business =[];

  void getbusiness(){
    emit(NewsLoadingBusinessState());
    DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'us',
          'category':'business',
          'apiKey':'1b95fc6cd6f347a18753ebabdc1fc7f4',

        } ).then((value) {print(value.data.toString());
            business=value.data['articles'];
            print(business);

          emit(NewsGetBusinessSuccess());
        }
    ).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessError(error.toString()));
    }
    );
  }



  List <dynamic> Sports =[];

  void getSports(){
    emit(NewsLoadingSportsState());
    if(Sports.length==0)
      {
        DioHelper.getData(url: 'v2/top-headlines',
            query:{
              'country':'us',
              'category':'sports',
              'apiKey':'1b95fc6cd6f347a18753ebabdc1fc7f4',

            } ).then((value) {print(value.data.toString());
        Sports=value.data['articles'];
        print(Sports);


        }
        ).catchError((error){
          print(error.toString());
          emit(NewsGetSportsError(error.toString()));
        }
        );

      }
    else{
      emit(NewsGetSportsSuccess());
    }
  }



  List <dynamic> Science =[];

  void getScience(){
    emit(NewsLoadingScienceState());
    if(Science.length==0)
      {

        DioHelper.getData(url: 'v2/top-headlines',
            query:{
              'country':'us',
              'category':'science',
              'apiKey':'1b95fc6cd6f347a18753ebabdc1fc7f4',

            } ).then((value) {print(value.data.toString());
        Science=value.data['articles'];
        print(Science);


        }
        ).catchError((error){
          print(error.toString());
          emit(NewsGetScienceError(error.toString()));
        }
        );
      }
    else
      {
        emit(NewsGetScienceSuccess());
      }

  }

  bool isDark =false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
      isDark = fromShared;
    else
    isDark = !isDark;
    CacheHelper.putData(key:'isDark' ,value: isDark).then((value) {
      emit(NewsChangeAppModeState());
    });
  }





  List <dynamic> search =[];

  void getSearch(String value){
    emit(NewsSearchLoadingState());
    DioHelper.getData(url: 'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'1b95fc6cd6f347a18753ebabdc1fc7f4',

        } ).then((value) {print(value.data.toString());
    search=value.data['articles'];
    print(search);

    emit(NewsSearchSuccState());
    }
    ).catchError((error){
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    }
    );
  }


}