import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/Network/remote/diohelper.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/cubit/cubit/cubit.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/cubit/states/states.dart';
import 'package:untitled/modules/screens/search/search_screen.dart';

import '../../cubit/states/states.dart';
import '../../cubit/states/states.dart';
import '../../cubit/states/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: ( context, state) {},
        builder: ( context,  state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context, searchScreen());
                }, icon: Icon(Icons.search)),
                IconButton( icon: Icon(Icons.brightness_4_outlined),
                  onPressed: (){
                    cubit.changeAppMode();
                  },)
              ],
            ),
            body: cubit.screens[cubit.selectIndex],
            bottomNavigationBar: BottomNavigationBar(
               currentIndex: cubit.selectIndex,
            onTap: (index){
                 cubit.ChangeBottomNav(index);
            }, items: cubit.BottomItems,),
          );
        },

      );

  }
}
