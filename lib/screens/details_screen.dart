import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matitation_app/constants.dart';
import 'package:matitation_app/widgets/bottom_nav_bar.dart';
import 'package:matitation_app/widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar() ,
      body: Stack(
        children:<Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color:kBlueLightColor,
              image:DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height:10),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight:FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: size.width * .6,
                      child: Text(
                        "Live happier and healthier by learning the fundamentals of meditaion and mindfulness"
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar()
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SessionCard(
                          sessionNum: 1,
                          isDone: true,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 2,
                          isDone: true,
                          press: (){},
                        ),
                         SessionCard(
                          sessionNum: 3,
                          isDone: true,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 4,
                          isDone: true,
                          press: (){},
                        ),
                         SessionCard(
                          sessionNum: 5,
                          isDone: true,
                          press: (){},
                        ),
                        SessionCard(
                          sessionNum: 6,
                          isDone: true,
                          press: (){},
                        ),
                      ]
                    ),
                    SizedBox(height:20),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                          ),
                        ], 
                      ),
                      child: Row(
                        children:<Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg"
                          ),
                          SizedBox(width:20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Basic 2",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text(
                                  "Start your deepen you practice"
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg") ,
                          )
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key key, this.sessionNum, this.isDone=false, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: Constraint.maxWidth / 2-10,
            //padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  offset:Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,

                ),
              ]
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 42,
                        width: 43,
                        decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color:kBlueColor),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone ? Colors.white : kBlueColor,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Session $sessionNum",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}