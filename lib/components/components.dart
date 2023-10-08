
import 'package:flutter/material.dart';
import 'package:untitled/modules/screens/search/search_screen.dart';
import 'package:untitled/modules/screens/webview/webview_screen.dart';

Widget designScreen(article,context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(8.0),

    child: Row(

      children: [

        Container(

          height: 120.0,

          width: 120.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(image: NetworkImage('${article['urlToImage']}'),

            fit: BoxFit.cover),

          ),



        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                SizedBox(

                  height: 10.0,

                ),

                Text('${article['publishedAt']}',style: TextStyle(

                  fontSize: 15.0,

                  fontWeight: FontWeight.bold,

                ),),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget sepretor() => Container(
  height: 0.5,
  color: Colors.grey,
);


void navigateTo(context,widget) => Navigator.push(
  context ,
  MaterialPageRoute(builder: (context)=> widget),

);