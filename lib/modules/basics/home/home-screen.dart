import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading : const Icon(
            Icons.menu,
          ),
          title : const Text (
              'First App'
          ) ,
          actions: [
            IconButton(onPressed: (){
                print ('notification_important');
            },
              icon: const Icon(
                Icons.notifications,
              ),
            ),
            IconButton(
              onPressed: (){
                  print ('search');
              },
              icon:  const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body : Column(
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.all(20.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(20.0)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:[
                    const Image(
                      image:NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                      ),
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsetsDirectional.symmetric (
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: const Text(
                        'Flower',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsetsDirectional.all(20.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(20.0)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:[
                    const Image(
                      image:NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                      ),
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsetsDirectional.symmetric (
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: const Text(
                        'Flower',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsetsDirectional.all(20.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(20.0)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:[
                    const Image(
                      image:NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
                      ),
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsetsDirectional.symmetric (
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: const Text(
                        'Flower',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
