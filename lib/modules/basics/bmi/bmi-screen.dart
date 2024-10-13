import 'dart:math';
import 'package:flutter/material.dart';
import 'package:udemy/shared/styles/colors.dart';

class bmiScreen extends StatefulWidget {

  @override
  State<bmiScreen> createState() => _bmiScreenState();
}

class _bmiScreenState extends State<bmiScreen> {

  bool is_result = false ;
  bool is_sun = true;
  bool is_male = true ;
  double height = 150 ;
  int weight = 50 ;
  int age = 20 ;
  var result ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: is_sun ? sunny : night ,
        title: Text(
          'BMI Calculator',
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {});
              is_sun=!is_sun;
            },
            icon:Icon(!is_sun?Icons.sunny:Icons.nightlight,
              color: is_sun?sun:moon,
            ),
          ),
        ],
      ),
      body: is_result?
      Stack(
        children: [
          Container(
            color: is_sun ? sunny_body : night_body ,
            child: Column(
              children: [
                Expanded(child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 20.0,start: 20.0,end: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:(){
                            setState(() {});
                            is_male=true;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: is_sun ? is_male ? sunny : sunny_theme : is_male ? sunny : night_theme ,
                            ),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.male,
                                  size: 80.0 ,
                                  color: is_sun ? is_male ? button : Colors.black : is_male ? Colors.black : button ,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'MALE',
                                  style: TextStyle(
                                    fontSize: 22.5,
                                    color: is_sun ? is_male ? button : Colors.black : is_male ? Colors.black : button,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap:(){
                            setState(() {});
                            is_male=false ;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: is_sun ? !is_male ? sunny : sunny_theme : !is_male ? sunny : night_theme ,
                            ),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.female,
                                  size:80.0 ,
                                  color: is_sun ? !is_male ? button : Colors.black : !is_male ? Colors.black : button,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'FEMALE',
                                  style: TextStyle(
                                    fontSize: 22.5,
                                    color: is_sun ? !is_male ? button : Colors.black : !is_male ? Colors.black : button ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(child: Padding(
                  padding: EdgeInsetsDirectional.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: is_sun ? sunny_theme : night_theme,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'height'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 22.5,
                            color : is_sun ? moon : button ,
                          ),
                        ),
                        SizedBox(
                          height: 7.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w800,
                                color : is_sun ? moon : button  ,
                              ),
                            ),
                            SizedBox(
                              width: 2.5,
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                color : is_sun ? moon : button  ,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Slider(
                          value: height,
                          max: 220,
                          min: 80,
                          onChanged: (value){
                            setState(() {});
                            height=value;
                          },
                          activeColor:  sunny  ,
                          inactiveColor: sunny_body ,
                          thumbColor:  sunny ,
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(child: Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 20.0,start: 20.0,end: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: is_sun ? sunny_theme : night_theme ,
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'weight'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22.5,
                                  color : is_sun ? moon : button  ,
                                ),
                              ),
                              Text(
                                '${weight}',
                                style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w800,
                                  color : is_sun ? moon : button  ,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: sunny,
                                    ),
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {});
                                        if(weight>1){weight--;}
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: button,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: sunny ,
                                    ),
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {});
                                        weight++;
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: button,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: is_sun ? sunny_theme : night_theme ,
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'age'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 22.5,
                                  color : is_sun ? moon : button  ,
                                ),
                              ),
                              Text(
                                '${age}',
                                style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w800,
                                  color : is_sun ? moon : button  ,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: sunny,
                                    ),
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {});
                                        if(age>1){age--;}
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: button,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: sunny,
                                    ),
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {});
                                        age++;
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: button ,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                Container(
                  color: is_sun ? sunny : night ,
                  child: TextButton(
                    onPressed: (){
                      setState(() {});
                      is_result = true ;
                      result = weight / pow(height/100,2);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 40.0,
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color : is_sun ? result_sunny : result_night,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: is_sun ? sunny : night ,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    width: 350.0,
                    height: 400.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          is_male ? 'gender : male'.toUpperCase() : 'gender : female'.toUpperCase() ,
                          style: TextStyle(
                            color : button ,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'age : ${age}'.toUpperCase(),
                          style: TextStyle(
                            color : button ,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'result : ${result.round()}'.toUpperCase(),
                          style: TextStyle(
                            color : button ,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    width: 350.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: is_sun ? sunny : night ,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {}) ;
                        is_result = false ;
                      },
                      child: Text(
                        'back'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: button,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                ],
              ),
            ),
          ),
        ],
      )
          :
      Container(
        color: is_sun ? sunny_body : night_body ,
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: EdgeInsetsDirectional.only(top: 20.0,start: 20.0,end: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {});
                        is_male=true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: is_sun ? is_male ? sunny : sunny_theme : is_male ? sunny : night_theme ,
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,
                              size: 80.0 ,
                              color: is_sun ? is_male ? button : Colors.black : is_male ? Colors.black : button ,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 22.5,
                                color: is_sun ? is_male ? button : Colors.black : is_male ? Colors.black : button,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {});
                        is_male=false ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: is_sun ? !is_male ? sunny : sunny_theme : !is_male ? sunny : night_theme ,
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,
                              size:80.0 ,
                              color: is_sun ? !is_male ? button : Colors.black : !is_male ? Colors.black : button,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 22.5,
                                color: is_sun ? !is_male ? button : Colors.black : !is_male ? Colors.black : button ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(child: Padding(
              padding: EdgeInsetsDirectional.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: is_sun ? sunny_theme : night_theme,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'height'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 22.5,
                        color : is_sun ? moon : button ,
                      ),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w800,
                            color : is_sun ? moon : button  ,
                          ),
                        ),
                        SizedBox(
                          width: 2.5,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color : is_sun ? moon : button  ,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (value){
                        setState(() {});
                        height=value;
                      },
                      activeColor:  sunny  ,
                      inactiveColor: sunny_body ,
                      thumbColor:  sunny ,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(child: Padding(
              padding: EdgeInsetsDirectional.only(bottom: 20.0,start: 20.0,end: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: is_sun ? sunny_theme : night_theme ,
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'weight'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 22.5,
                              color : is_sun ? moon : button  ,
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w800,
                              color : is_sun ? moon : button  ,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: sunny,
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {});
                                    if(weight>1){weight--;}
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: button,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: sunny ,
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {});
                                    weight++;
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: button,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: is_sun ? sunny_theme : night_theme ,
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'age'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 22.5,
                              color : is_sun ? moon : button  ,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w800,
                              color : is_sun ? moon : button  ,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: sunny,
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {});
                                    if(age>1){age--;}
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: button,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: sunny,
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {});
                                    age++;
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: button ,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Container(
              color: is_sun ? sunny : night ,
              child: TextButton(
                onPressed: (){
                  setState(() {});
                  is_result = true ;
                  result = weight / pow(height/100,2);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40.0,
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
