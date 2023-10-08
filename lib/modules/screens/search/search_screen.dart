import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/cubit/cubit/cubit.dart';
import 'package:untitled/cubit/states/states.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: ( context, state) {},
      builder: ( context, Object? state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title:Center(child: Text('Search')),elevation: 0,),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(
                  child: TextFormField(
                    controller:  TextEditingController(),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },

                    onChanged:  (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Search must not be empty';
                      }
                      else
                        return null;
                    },
                    decoration:InputDecoration(
                      prefixIconColor: Colors.deepOrange,
                      icon: Icon(Icons.search_outlined),
                      labelText: 'Search',
                    ) ,

                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: ConditionalBuilder(
                    condition: list.length >0,
                    builder: (BuildContext context) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: ((context, index) => designScreen(list[index], context)),
                          separatorBuilder: (context, index) => sepretor(),
                          itemCount: list.length);
                    },
                    fallback: (context) => Center(child: CircularProgressIndicator()) ,
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
