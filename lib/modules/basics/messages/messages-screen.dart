import 'package:flutter/material.dart';

class messagesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: const Row (
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon (
                Icons.camera_alt,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.blue,
              child: Icon (
                Icons.edit,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical ,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(30.0),
                  color : Colors.grey[300],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ) ,
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Search',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildStoryItem();
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(
                      width: 20.0,
                    );
                  },
                  itemCount : 10,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics:const NeverScrollableScrollPhysics() ,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return buildChatItem();
                },
                separatorBuilder: (context, index){
                  return const SizedBox(
                    height: 20.0,
                  );
                },
                itemCount : 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem () {
    return
      const Row (
        children:[
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
              ),
              CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 2.0,
                  end: 2.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdulallah ali mansour ali mansour ali mansour ali maounsr',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children:[
                    Expanded(
                      child: Text (
                        'hello ... How are you ??? if you read my messeges you should write YES ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: CircleAvatar(
                        radius: 2.0,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    Text (
                      '10.48 PM',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  }

  Widget buildStoryItem () {
    return const SizedBox(
      width: 50.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
              ),
              CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 2.0,
                  end: 2.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'abdulallah mansour ali maonsour',
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
