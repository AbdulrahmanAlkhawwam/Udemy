import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:udemy/layout/news/cubit/cubit.dart';
import 'package:udemy/layout/todo/cubit/cubit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:udemy/modules/news/news-web_view/webView-news-screen.dart';
import 'package:udemy/shared/network/local/cache-helper.dart';
import '../../modules/news/news-search/search-news-screen.dart';

////////////////////////////////////////////////////////////////////////////////

Widget bottom ({
  double width = double.infinity,
  double height = 50,
  double radius = 3.0,
  Color color = Colors.blue,
  required String text,
  required Function() onPressed,
})=> Container(
  width: width,
  height: height,
  child: MaterialButton(
    child: Text(
      text ,
      style: TextStyle(
        color: Colors.white,
      ) ,
    ),
    onPressed: onPressed ,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: color,
  ),
);

////////////////////////////////////////////////////////////////////////////////

Widget textBottom ({
  required Text text,
  required Function() onPressed,
})=> TextButton(onPressed: onPressed, child: text);

////////////////////////////////////////////////////////////////////////////////

// textFF = text Form Field
Widget textFF ({
  required TextEditingController controller ,
  required String labelText ,
  required String validate,
  TextInputType ? keyboardType ,
  TextDirection ? textDirection ,
  TextStyle ? labelStyle ,
  bool obscure = false ,
  String ? helperText ,
  Color ? color ,
  IconButton ? suffixIcon ,
  IconButton ? prefixIcon ,
  double radius = 5.0,
  int maxLines = 1 ,
  int ? maxLength ,
  Function()? onTap ,
  Function(String)? onChanged ,
  Function(String)? onSubmitted ,
}) => TextFormField(
  controller : controller,
  decoration : InputDecoration (
    prefixIconColor : color ,
    prefixIcon : prefixIcon ,
    suffixIconColor : color ,
    suffixIcon : suffixIcon ,
    labelText : labelText ,
    labelStyle : labelStyle ,
    helperText : helperText ,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
  ),
  keyboardType : keyboardType,
  textDirection: textDirection ,
  obscureText: obscure ,
  maxLines: maxLines ,
  maxLength: maxLength ,
  onTap: onTap ,
  onChanged: onChanged ,
  validator: (value) => (value!.isEmpty) ? validate : null ,
  onFieldSubmitted: onSubmitted ,
);

////////////////////////////////////////////////////////////////////////////////

// buildNTI = build New Tasks Item
Widget buildNTI ({
  required String time ,
  required String title ,
  required String date ,
  required int index ,
  required var context ,
}) => Stack(
  children: [
    Container(
      color: Colors.red,
      width: double.infinity,
      height: 100.0,
      child: Row(
        children: [
          Expanded(child: Center(child: Text('delete',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25.0),))),
        ],
      ),
    ),
    Dismissible(
      key: Key(todoAppCubit.get(context).newTasks[index]['id'].toString()),
      child:   Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    style:TextStyle (
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      color:  Colors.white,
                    ),
                    time,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style:TextStyle (
                        color:  Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      date,
                      style:TextStyle (
                        color:  Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: (){
                    todoAppCubit.get(context).updateDatabase(status: 'done', id: todoAppCubit.get(context).newTasks[index]['id'],);
                  },
                  icon: Icon(Icons.check_box_outlined)),
              IconButton(
                  onPressed: (){
                    todoAppCubit.get(context).updateDatabase(status: 'archive', id: todoAppCubit.get(context).newTasks[index]['id'],);
                  },
                  icon: Icon(Icons.archive_outlined)),
            ],
          ),
        ),
      ),
      onDismissed: (direction){
        todoAppCubit.get(context).deleteDatabase(id: todoAppCubit.get(context).newTasks[index]['id']);
      },
    ),
  ],
);

////////////////////////////////////////////////////////////////////////////////

// buildDTI = build Done Tasks Item
Widget buildDTI ({
  required String time ,
  required String title ,
  required String date ,
  required int index ,
  required var context ,
}) => Stack(
  children: [
    Container(
      color: Colors.red,
      width: double.infinity,
      height: 100.0,
      child: Row(
        children: [
          Expanded(child: Center(child: Text('delete',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25.0),))),
        ],
      ),
    ),
    Dismissible(
      key: Key(todoAppCubit.get(context).doneTasks[index]['id'].toString()),
      child:   Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    style:TextStyle (
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      color:  Colors.white,
                    ),
                    time,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style:TextStyle (
                        color:  Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      date,
                      style:TextStyle (
                        color:  Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: (){
                    if (todoAppCubit.get(context).doneTasks[index]['status'] == 'done'){
                      todoAppCubit.get(context).updateDatabase(status: 'new', id: todoAppCubit.get(context).doneTasks[index]['id']);
                    }
                    else {
                      todoAppCubit.get(context).updateDatabase(status: 'done', id: todoAppCubit.get(context).doneTasks[index]['id'],);
                    }
                    },
                  icon: Icon(Icons.check_box,color: Colors.green,)),
              IconButton(
                  onPressed: (){
                    todoAppCubit.get(context).updateDatabase(status: 'archive', id: todoAppCubit.get(context).doneTasks[index]['id'],);
                  },
                  icon: Icon(Icons.archive_outlined)),
            ],
          ),
        ),
      ),
      onDismissed: (direction){
        todoAppCubit.get(context).deleteDatabase(id: todoAppCubit.get(context).doneTasks[index]['id']);
      },
    ),
  ],
);

////////////////////////////////////////////////////////////////////////////////

// buildATI = build Archived Tasks Item
Widget buildATI ({
  required String time ,
  required String title ,
  required String date ,
  required int index ,
  required var context ,
}) => Stack(
  children: [
    Container(
      color: Colors.red,
      width: double.infinity,
      height: 100.0,
      child: Row(
        children: [
          Expanded(child: Center(child: Text('delete',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25.0),))),
        ],
      ),
    ),
    Dismissible(

      key: Key(todoAppCubit.get(context).archiveTasks[index]['id'].toString()),
      child:   Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    style:TextStyle (
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      color:  Colors.white,
                    ),
                    time,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style:TextStyle (
                        color:  Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      date,
                      style:TextStyle (
                        color:  Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                  onPressed: (){
                       todoAppCubit.get(context).updateDatabase(status: 'done', id: todoAppCubit.get(context).archiveTasks[index]['id'],);
                  },
                  icon: Icon(Icons.check_box_outlined)),
              IconButton(
                  onPressed: (){
                    if (todoAppCubit.get(context).archiveTasks[index]['status'] == 'archive') {
                      todoAppCubit.get(context).updateDatabase(status: 'new', id: todoAppCubit.get(context).archiveTasks[index]['id'],);
                    }
                    else {
                      todoAppCubit.get(context).updateDatabase(status: 'archive', id: todoAppCubit.get(context).archiveTasks[index]['id']);
                    }
                  },
                  icon: Icon(Icons.archive,color: Colors.blue[900],)),
            ],
          ),
        ),
      ),
      onDismissed: (direction){
        todoAppCubit.get(context).deleteDatabase(id: todoAppCubit.get(context).archiveTasks[index]['id']);
      },
    ),
  ],
);

////////////////////////////////////////////////////////////////////////////////

Widget divider()=> Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
    child: Container(
      color: Colors.grey[400],
      width: double.infinity,
      height: 1,
    ),
  );

////////////////////////////////////////////////////////////////////////////////

void navigateTo (
    context,
    route,
    ) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route,)
);

////////////////////////////////////////////////////////////////////////////////

void navigateAndFinish (
    context,
    route,
    ) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) {
    {
      return route;
    }
  },),
      (route)=>false ,
);

////////////////////////////////////////////////////////////////////////////////

Widget buildArticleItem(article, context) {
  bool? isDark =CacheHelper.getBoolean(key: 'isDark');
  return InkWell(
    onTap: (){
      navigateTo(context, webViewScreen(article['url']));
    },
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0,),
            color: Colors.deepOrange,
              image:  article['urlToImage']!=null ? DecorationImage(
              image:NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ):null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.report_gmailerrorred_outlined,
                color: Colors.white,
                size: article['urlToImage']==null ?70.0:0.0,
              ),
              if (article['urlToImage']==null)
              Text('no photo',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
            ],
          )
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Text(
                '${article['title']}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: isDark! ?Colors.white:Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 15.0,),
              Row(
                children: [
                  Text(
                    '${article['publishedAt'].substring(11,16)}',
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 10.0,end: 80.0),
                    child: CircleAvatar(
                      radius: 2.50,
                    ),
                  ),
                  Text(
                    article['publishedAt'].substring(0,10),
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
      ],
    ),
),
  );
}

////////////////////////////////////////////////////////////////////////////////

Widget articleBuilder(list, context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => divider(),
        itemCount: 10,),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);

////////////////////////////////////////////////////////////////////////////////

Widget searchBar ({context}) =>  Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Expanded(
        child: Container(
          height: 40.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.deepOrange,
          ),
          child: MaterialButton(
            highlightColor: CacheHelper.getBoolean(key: 'isDark')!?HexColor('333739'):Colors.white,
            onPressed: (){
              newsAppCubit.get(context).search = [];
              navigateTo(context, searchNewsScreen());
            },
            child: Row(
              children: [
                SizedBox(width: 10.0,),
                Expanded(
                  child: Text('search',style: TextStyle(
                    color: CacheHelper.getBoolean(key: 'isDark')!?HexColor('333739'):Colors.white,
                    fontSize: 17.5,
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      IconButton(
          onPressed: (){
        newsAppCubit.get(context).search = [];
        navigateTo(context, searchNewsScreen());
      },
          icon: Icon(Icons.search,color: Colors.deepOrange,
          ),
      ),
    ],
  ),
);

////////////////////////////////////////////////////////////////////////////////