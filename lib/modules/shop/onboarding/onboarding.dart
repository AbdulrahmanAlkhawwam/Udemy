import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy/modules/shop/login/login.dart';
import 'package:udemy/shared/components/components.dart';
import '../../../models/shop/shop-model.dart';

class onboardingScreen extends StatelessWidget {
  
  var controller = PageController();
  List <boardingModel> boarding = [
    boardingModel(image: 'images/02.png', title: 'first title', body: 'first body'),
    boardingModel(image: 'images/03.png', title: 'second title', body: 'second body'),
  ];
  bool isLast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("F8F8FA"),
      appBar :AppBar(
        backgroundColor: HexColor("F8F8FA"),
        elevation: 0.0,
        actions: [
          textBottom(
              text: Text(
                'skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromRGBO(85, 205, 150, 1.0),
                ),
              ),
              onPressed: ()=> navigateAndFinish(context, loginScreen())
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index){
                if (index== boarding.length-1) isLast = true ;
                else isLast = false ;
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>
                  buildOnboardingItem(model: boarding[index]),
              itemCount: boarding.length,
         ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color.fromRGBO(85, 205, 150, 1.0),
                    dotHeight: 10,
                    expansionFactor: 3.5,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                  controller: controller,
                  count: boarding.length,
                ),
                Expanded(child: Container()),
                FloatingActionButton(
                  shape: CircleBorder(eccentricity: BorderSide.strokeAlignOutside),
                  backgroundColor:Color.fromRGBO(85, 205, 150, 1.0),
                  onPressed: (){
                    if (isLast)
                      navigateAndFinish(context, loginScreen());
                    else
                      controller.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastEaseInToSlowEaseOut
                      );

                  },
                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey[300],),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildOnboardingItem ({required boardingModel model})=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.asset(model.image)),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text(
          model.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
         model.body,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
    ],
  ) ;
}
