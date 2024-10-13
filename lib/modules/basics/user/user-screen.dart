import 'package:flutter/material.dart';
import 'package:udemy/models/user/user-model.dart';

class userScreen extends StatelessWidget {

  List<UserModel>users = [
    UserModel(
      id: 1,
      name:  'ali ahmad',
      phone: '+963912345678',
    ),
    UserModel(
      id: 2,
      name:  'mohammad ahmad',
      phone: '+963923456789',
    ),
    UserModel(
      id: 3,
      name:  'ahmad osama',
      phone: '+9633456789',
    ),
    UserModel(
      id: 1,
      name:  'ali ahmad',
      phone: '+963912345678',
    ),
    UserModel(
      id: 3,
      name:  'ahmad osama',
      phone: '+9633456789',
    ),
    UserModel(
      id: 1,
      name:  'ali ahmad',
      phone: '+963912345678',
    ),
    UserModel(
      id: 2,
      name:  'mohammad ahmad',
      phone: '+963923456789',
    ),
    UserModel(
      id: 3,
      name:  'ahmad osama',
      phone: '+9633456789',
    ),
    UserModel(
      id: 1,
      name:  'ali ahmad',
      phone: '+963912345678',
    ),
    UserModel(
      id: 3,
      name:  'ahmad osama',
      phone: '+9633456789',
    ),
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context,index)=> buildUsersItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
          ),
          itemCount: users.length,
        ),
      ),
    );
  }

  Widget buildUsersItem (UserModel user){
    return Padding(
      padding: const EdgeInsetsDirectional.all(20.0),
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Text(
              '${user.id}',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0
                  ),
                ),
                Text(
                  user.phone,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

/*
* 1.build item
* 2.build list
* 3.add item to list
*/
}
