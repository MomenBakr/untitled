import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/cubit/cubit/cubit.dart';
import 'package:untitled/cubit/states/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      listener: (context,State){},
      builder: (context,State){
        var list = NewsCubit.get(context).Science;
        return  ConditionalBuilder(
          condition: list.length >0,
          builder: (BuildContext context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => designScreen(list[index],context) ,
                separatorBuilder: (context, index) => sepretor(),
                itemCount : list.length);
          },
          fallback: (context) =>Center(child: CircularProgressIndicator()) ,

        );
      },
    );






  }
}
